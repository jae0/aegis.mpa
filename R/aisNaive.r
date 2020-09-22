

aisNaive <- function(n=20, wallpercent=20, nsim=10 ) {
  #\\ n = field size
  #\\ wallpercent = percent with walls

  if (0) {
    loadfunctions( "ais" )
    set.seed(3)
    n = 20
    nsim = 1000
    wallpercent = 20
    aisNaive( 50, 10, 1000 )
  }

  iniField <- initializeField(n, wallpercent)
  field <- iniField$field
  startposind<- iniField$startposind
  goalposind<-iniField$goalposind
  # costchart<-iniField$costchart
  fieldpointers<-iniField$fieldpointers

  # movementdirections <- c('R','L','D','U','LU','LD','RU','RD')

  nr <- nrow(field) # y/row
  nc <- ncol(field) # x/col

  pn = 8  # no of rel positions == 8
#  px = rep( Inf, pn)
#  py = rep( Inf, pn)

  # directional components:
  dx = c( -1, 1,  0,  0, 1,  1, -1, -1 )
  dy = c(  0, 0, -1,  1, 1, -1,  1, -1 )

# initialize the OPEN and CLOSED sets and their costs
  setId = matrix( 1:(nr*nc), ncol=nc, nrow=nr)

  setY =  matrix( rep( 1:nr, nc ), ncol=nc, nrow=nr)
  setX = matrix( (rep( 1, nr)) %*% t(1:nc), ncol=nc, nrow=nr)

  sx = setX[startposind]
  sy = setY[startposind]
  gx = setX[goalposind]
  gy = setY[goalposind]

  distancesS = sqrt( (setX- sx)^2 + (setY-sy) ^2)
  distancesG = sqrt( (setX- gx)^2 + (setY-gy) ^2)
  distances = ( distancesS + distancesG ) /2

  # define propensity == likelihood of an event
  propensity = 1 / (  distances^2) # cost to count
  propensity[ which( !is.finite( propensity)) ] = 0 # convert no-go locations to 0-value
  propensity[1,] = 0
  propensity[,1] = 0
  propensity[,nc] = 0
  propensity[nr,] = 0


  resolution = 1 # km
  mindist = sqrt( (setX[startposind] - setX[goalposind])^2 + (setY[startposind]-setY[goalposind]) ^2)
  maxsteps =  floor( 5 * mindist^2/resolution )  # tolerate some arbitrary upper bound

  paths = matrix( NA, ncol=maxsteps, nrow=nsim )
  paths[,1] = startposind
  sim = 1
  while ( sim <= nsim ) {
    print( paste("Simulation:", sim) )
    ns = 2
    solutionfound = FALSE
    while ( !solutionfound ) {
      curid = paths[sim,(ns-1)]
      cx = setX[curid]
      cy = setY[curid]
      px = cx + dx
      py = cy + dy
      # range checks
      #toofar = NULL
      #toofar = .Internal( which( px <= 1 | px >= nc | py <= 1 | py >= nr  ) )
      #if( length(toofar) > 0 ) {
      #  px[ toofar] = cx  # dummy values
      #  py[ toofar] = cy
      #}
      posinds = setId[ cbind( py, px) ]
      probs = propensity[ posinds ]
      # if( length(toofar) > 0 ) probs[toofar] = 0
      probs = probs / sum(probs)
      paths[sim,ns] = posinds[ .Internal(sample(n=pn, size=1, replace=FALSE, prob=probs)) ]
      if ( paths[sim,ns] == goalposind ) {
        solutionfound=TRUE
        # find shortest path
        o = paths[sim,]
        od =.Internal(  which( duplicated( o, incomparables=NA ) ) )
        if (length(od)>0) {
          ood = sort( unique( o[ od ] ) )
          for ( h in ood ) {
            s = .Internal( which( o %in% h ) )
            if (length(s) >0 ) o[( min(s)+1):max(s) ] = NA
          }
          paths[sim,] = NA
          res = o[ .Internal( which(is.finite(o))) ]
          nres = length(res)
          if ( nres > 0 ) paths[sim,1:nres] = res
        }
        sim = sim+1
        break()
      }
      ns = ns + 1
      if ( ns >= maxsteps ) {
        print ("Reached maxsteps .. restarting")
        paths[sim, 2:maxsteps ] = NA
        ns=2 # restart
      }
    }
  }

  # count densities
  out = matrix( 0,  ncol=nc, nrow=nr)
  for (i in 1:nsim) {
    for( j in 1:maxsteps ) {
      k = paths[i,j]
      if (is.na(k)) break()
      out[k] = out[k] + 1
    }
  }

  sm =apply( paths, 1, function(x) length( which(is.finite(x)) ) )
  sm[which( sm <= mindist)] = NA  # likely errors
  shortest = min( sm, na.rm=TRUE )
  u = which( sm == shortest )
  if (length(u)>1 ){

    v = apply( paths[u,], 1, function(x) sum( out[x], na.rm=TRUE ) )
    u = which.max( v )

  }
  pathShortest = paths[ u,]
  pathShortest = pathShortest[ which(is.finite( pathShortest)) ]
  coordsShortest = data.frame( cbind(
    x = setX[ pathShortest ],
    y = setY[ pathShortest ]
  ))

  image(out)
  lines ( coordsShortest$y/nr, coordsShortest$x/nc, col="green", lwd=3 )

  image (propensity)
  lines ( coordsShortest$y/nr, coordsShortest$x/nc, col="green", lwd=3 )

}

