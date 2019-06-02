
Astar_8dir_fast <- function(n=20, wallpercent=20 ) {
  #\\ n = field size
  #\\ wallpercent = percent with walls

  if (0) {
    loadfunctions( "ais" )
    set.seed(10)
    n = 20
    wallpercent = 20
    Astar_8dir_fast( n, wallpercent)

    set.seed(3); system.time(  Astar_8dir( 200, wallpercent) )
#[1] "Solution found!"
#   user  system elapsed
# 15.083   0.000  15.120
    set.seed(3); system.time(  Astar_8dir_fast( 200, wallpercent) )
#[1] "Solution found!"
#   user  system elapsed
#  4.760   0.000   4.799
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
  setOpenHeur[startposind] = Inf

  # as long as we have not found the goal or run out of spaces to explore#
  count = 0
  cmax = n* m
  while ( count < cmax ) {
    count = count + 1
    so = .Internal(which(setOpenId))

    if (length(so)<1) break()
    if (goalposind %in% so ) break()

    # for the element in OPEN with the smallest cost
    foc = which.min(costchart[so] + setOpenHeur[so])
    ii = so[foc]

    # find costs and heuristic of moving the neighbor spaces to goal
    px = setX[ii] + dx
    py = setY[ii] + dy

    # range checks
    toofar = NULL
    toofar = .Internal( which( px < 1 | px > m | py < 1 | py > n  ) )
    if( length(toofar) > 0 ) {
      px[ toofar] = 1  # default was to set to 1,1
      py[ toofar] = 1  # default was to set to 1,1
    }
    posinds = setId[ cbind( py, px) ]

    # costs
    costs = costchart[ii] + field[ posinds ];  # costs
    if( length(toofar) > 0 ) costs[toofar] = Inf

    # heuristics
    heuristics = abs( gx - px) + abs( gy - py) # heuristics, abs distance from (gx, gy)
    if( length(toofar) > 0 ) heuristics[toofar] = Inf
    # additional heuristic costs for diagonals;
    heuristics[dd] = heuristics[dd] +  sqrt2_2 * .Internal( pmin(na.rm=FALSE, abs( gx - px[dd] ), abs( gy - py[dd] )))

    # put node in CLOSED and record its cost
    setClosedId[ii] = TRUE
    setOpenId[ii] = FALSE

    setClosedIdCur = .Internal( which(setClosedId) )

    for (jj in 1:pn ) {
      jind <- posinds[jj]
      cind <- costs[jj]
      if (is.infinite(cind)) next()
      setOpenIdCur = .Internal(which(setOpenId ))
      oo = .Internal( which ( setOpenIdCur %in% jind ) )
      if( length(oo)>0 ) {
        ooid = setOpenIdCur[oo]
        if (costchart[ooid] > cind) {
          costchart[ ooid ] <- cind
          setOpenHeur[ ooid ] <- heuristics[jj]
          fieldpointers[ ooid ] <- movementdirections[jj]
        }
      } else {
        cc = .Internal( which ( setClosedIdCur %in% jind ) )
        if (length(cc) > 0 ) {
          ccid = setClosedIdCur[cc]
          if ( costchart[ccid] > cind) {
            costchart[ccid ] <- cind
            fieldpointers[ ccid ] <- movementdirections[jj]
          }
        } else {
          uu = c( setClosedIdCur, setOpenIdCur)
          if (! (jind %in% uu)) {
            costchart[jind] <- cind
            setOpenId[jind] = TRUE
            setOpenHeur[jind] = heuristics[jj]
            fieldpointers[jind] <- movementdirections[jj]
          } } }
  }}

  if (any(goalposind %in% which(setOpenId) )) {
    print('Solution found!')
    CreateChart(field,costchart,startposind,goalposind)
    p<- vessel_findWayBack(goalposind,fieldpointers,field)
    points(p[,2],p[,1],type="l",   lty=1, lwd=3)
  } else if (!any(goalposind %in% which(setOpenId) )){
    print('No Solution!')
  }

}

