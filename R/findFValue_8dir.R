findFValue_8dir <-function(posind,costsofar, field, goalind){
  #\\ This function finds the movement COST for each tile surrounding POSIND in
  #\\ FIELD, returns their position indices POSINDS. They are ordered:
  #\\ 'R','L','D','U','RU','RD','LU','LD'

  n <- nrow(field) # length of the field
  m <- ncol(field)

  out = matrix( Inf, nrow=8, ncol=5 )  # posx, posy, posind, cost, heuristics
  colnames(out) = c("x", "y", "posind", "cost", "heuristics" )

  # convert (cell) linear index into [row column]
  pind = c(posind, goalind)
  py = ((pind-1)%%n) + 1      # y
  px = floor((pind-1)/n) + 1  # x

  # convert linear index into [row column]
  # directional components:
  dx = c( -1, 1,  0,  0, 1,  1, -1, -1 )
  dy = c(  0, 0, -1,  1, 1, -1,  1, -1 )
  out[,1] = px[1] + dx
  out[,2] = py[1] + dy

  # range checks
  toofar = NULL
  toofar = which( out[,1] < 1 | out[,1] > m | out[,2] < 1 | out[,2] > n )
  if( length(toofar) > 0 ) out[toofar,c(1,2)] = 1  # default was to set to 1,1

  # compute the cell index for these coords
  out[,3] = ( out[,1]-1) * n + out[,2]

  # not used ?:
  # z <- sqrt(2)
  # diagonalfactor <- 1 # May need to be scaled to the a similar scale as the cost function
  # gridresoltuion <- 0.01 # degrees

  # costs
  out[,4] = costsofar + field[ out[,3] ];  # costs

  # heuristics
  out[,5] = abs( px[2] - out[,1]) + abs( py[2] - out[,2] ) # heuristics, abs distance from (px[2], py[2])

  # additional heuristic costs for diagonals;
  DD = c(5:8)
  out[DD,5] = out[DD,5] + (sqrt(2) - 2) * pmin( abs( px[2] - out[DD, 1] ), abs( py[2] - out[DD, 2] ))

  if( length(toofar) > 0 ) out[toofar,c(4,5)] = Inf

  return( out )
}

