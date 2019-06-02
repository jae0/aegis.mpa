

aisNaive <- function(n=20, wallpercent=20 ) {
  #\\ n = field size
  #\\ wallpercent = percent with walls

  if (0) {
    loadfunctions( "ais" )
    set.seed(10)
    n = 100
    wallpercent = 20
    aisNaive( 100,20 )
  }

  iniField<- initializeField(n, wallpercent)
  field<- iniField$field
  startposind<- iniField$startposind
  goalposind<-iniField$goalposind
  costchart<-iniField$costchart
  fieldpointers<-iniField$fieldpointers

  movementdirections <- c('R','L','D','U','LU','LD','RU','RD')

  n <- nrow(field) # y/row
  m <- ncol(field) # x/col

  pn = 8  # no of rel positions == 8
  px = rep( Inf, pn)
  py = rep( Inf, pn)

  # directional components:
  dx = c( -1, 1,  0,  0, 1,  1, -1, -1 )
  dy = c(  0, 0, -1,  1, 1, -1,  1, -1 )

  dd = c(5:8) # which of above are diagonal elements
  sqrt2_2 = sqrt(2) -2

# initialize the OPEN and CLOSED sets and their costs
  setId = matrix( 1:(n*m), ncol=m, nrow=n)
  setOpenCost = setOpenHeur  = setId*NA

  setOpenId = setClosedId = matrix( FALSE,  ncol=m, nrow=n)

  setY = setId
  setY[] = rep( 1:n, m )

  setX = setId
  setX[] = (rep( 1, n)) %*% t(1:m)

  gx = setX[goalposind]
  gy = setY[goalposind]

  setOpenId[startposind] = TRUE
  costchart[startposind] = 0

  distancesG = sqrt( (setX- setX[goalposind])^2 + (setY-setY[goalposind]) ^2)
  distancesS = sqrt( (setX- setX[startposind])^2 + (setY-setY[startposind]) ^2)
  distances = ( distancesS + distancesG ) /2
  # distancesMin = sqrt( (setX[startposind] - setX[goalposind])^2 + (setY[startposind]-setY[goalposind]) ^2)

 # setOpenHeur[startposind] = Inf

  eps = 1e-9
  propensity = 1 / ( field * distances^2) # cost to count
  propensity[ which( !is.finite( propensity)) ] = eps
  propensity.sum = sum( propensity[ which( is.finite( propensity)) ] )
  nP = length(propensity)

  jump.increment =1
  resolution = 1 # km
  maxdist = sqrt( (setX[startposind] - setX[goalposind])^2 + (setY[startposind]-setY[goalposind]) ^2)
  maxsteps =  trunc( 2* ( maxdist / resolution ) ^ 2)  # tolerate some arbitrary upper bound

  nsim = 10

  paths = matrix( NA, ncol=maxsteps, nrow=nsim )
  paths[,1] = startposind

  sim = 1

  # as long as we have not found the goal or run out of spaces to explore#
  while ( sim <= nsim ) {
    ns = 2
    solutionfound = FALSE

    while ( !solutionfound ) {
      curid = paths[sim,(ns-1)]
      px = setX[curid] + dx
      py = setY[curid] + dy
      # range checks
      toofar = NULL
      toofar = .Internal( which( px <= 1 | px >= m | py <= 1 | py >= n  ) )
      if( length(toofar) > 0 ) {
        px[ toofar] = 1  # dummy values
        py[ toofar] = 1
      }
      posinds = setId[ cbind( py, px) ]

      py = propensity[ posinds ]
      if( length(toofar) > 0 ) py[toofar] = 0

      # do not return to past path
      prev = which(posinds %in% paths[sim,ns] )
      if( length(prev) > 0 ) py[ prev ] = 0

      py = py / sum(py)
      paths[sim,ns] = posinds[ sample( pn, size=1, replace=FALSE, prob=py ) ]
      if ( paths[sim,ns] == goalposind ) {
        solutionfound=TRUE
        sim = sim+1
        break()
      }
      ns = ns + 1
      if ( ns >= maxsteps ) {
        paths[sim, 2:maxsteps ] = NA
        ns=2 # restart
      }
    }
  }

  # count densities
  out = matrix( 0,  ncol=m, nrow=n)
  for (i in 1:nsim) {
    for( j in 1:maxsteps ) {
      k = paths[i,j]
      if (is.na(k)) break()
      out[k] = out[k] + 1
    }
  }

  # most likely path:
  pathLikely = startposind
  counter = 0
  finished = FALSE
  while ( ! finished ){
    nid = length(pathLikely)
    curid = pathLikely[ nid ]
    px = setX[curid] + dx
    py = setY[curid] + dy
    # range checks
    toofar = NULL
    toofar = .Internal( which( px <= 1 | px >= m | py <= 1 | py >= n  ) )
    if( length(toofar) > 0 ) {
      px[ toofar] = curid  # dummy values
      py[ toofar] = curid
    }
    posinds = setId[ cbind( py, px) ]
    choices = out[posinds]

    # do not return to past path
    prev = which(posinds %in% pathLikely )
    if( length(prev) > 0 ) choices[prev] = 0

    pathNext = posinds[ which.max( choices ) ]
    pathLikely = c( pathLikely, pathNext )
    counter = counter + 1
    if ( pathNext == goalposind ) finished = TRUE
    if ( counter > maxsteps ) break("Something went wrong")
  }

  coordsLikely = data.frame( cbind(
    x = setX[ pathLikely ],
    y = setY[ pathLikely ]
  ))

  image(out)

  lines ( coordsLikely$y/m, coordsLikely$x/n )

}

