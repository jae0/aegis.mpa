Astar_8dir <- function(nset, wallpercentset) {

  if (0) {
    set.seed(10)
    nset = 20
    wallpercentset = 20
  }

  n <- nset # Field size n * n tiles
  wallpercent<-wallpercentset

  iniField<- initializeField(n, wallpercent)

  field<- iniField$field

  startposind<- iniField$startposind
  goalposind<-iniField$goalposind
  costchart<-iniField$costchart
  fieldpointers<-iniField$fieldpointers


# initialize the OPEN and CLOSED sets and their costs
  setOpen <-startposind
  setOpenCosts <- 0
  setOpenHeuristics <- Inf
  setClosed <- vector()
  setClosedCosts <- vector()
  movementdirections <- c('R','L','D','U','LU','LD','RU','RD')

  # as long as we have not found the goal or run out of spaces to explore#
  while (!any(goalposind %in% setOpen) &&  length(setOpen)>0) {

    # for the element in OPEN with the smallest cost
    # [temp, ii] <- min(setOpenCosts + setOpenHeuristics)
    # ii is the number of squares that the function can examine and compute the cost for

    sumOpen <- setOpenCosts + setOpenHeuristics
    temp <-min(sumOpen,na.rm = TRUE)
    ii<-which(sumOpen == temp)
    # find costs and heuristic of moving the neighbor spaces to goal
    # in order 'R','L','D','U','RU','RD','LU','LD'

    FValue <- findFValue_8dir(setOpen[ii],setOpenCosts[ii], field,goalposind)

   #  browser()

    costs<- FValue[,"cost"]
    heuristics<-FValue[,"heuristics"]

    # put node in CLOSED and record its cost
    setClosed <- c(setClosed,  setOpen[ii])
    setClosedCosts <- c(setClosedCosts,  setOpenCosts[ii])

    # update OPEN and their associated costs
    if (ii > 1 && ii < length(setOpen)) {
      remove<-ii
    } else if (ii == 1) {
      remove<-1
    } else {
      remove<-length(setOpen)
    }

    if (length(remove)>0){
      setOpen <- setOpen[-remove]
      setOpenCosts <- setOpenCosts[-remove]
      setOpenHeuristics <- setOpenHeuristics[-remove]
    }

    # for each of these neighbor spaces, assign costs and pointers;
    # and if some are in the CLOSED set and their costs are smaller,
    # update their costs and pointers
    nlocs = nrow(FValue)

    for (jj in 1:nlocs) {

      jind<- FValue[jj, "posind"]
      cind <- costs[jj]

       # if cost infinite, then it's a wall, so ignore
      if (!is.infinite(cind)) {
        # if node is not in OPEN or CLOSED then insert into costchart and
        # movement pointers, and put node in OPEN

      if (!any(jind  %in% c(setClosed, setOpen))) {
        fieldpointers[jind] <- movementdirections[jj]
        costchart[jind] <- cind
        setOpen <- c(setOpen, jind)
        setOpenCosts <- c(setOpenCosts, cind)
        setOpenHeuristics <- c(setOpenHeuristics, heuristics[jj])
      # else node has already been seen, so check to see if we have
      # found a better route to it.
      } else if (any(jind %in% setOpen )) {
        I <- which(setOpen %in% jind)
        # update if we have a better route
        if (length(I)>0){
          if (setOpenCosts[I] > cind) {
            costchart[setOpen[I]] <- cind
            setOpenCosts[I] <- cind
            setOpenHeuristics[I] <- heuristics[jj]
            fieldpointers[setOpen[I]] <- movementdirections[jj]
          }
        }

      # else node has already been CLOSED, so check to see if we have
      # found a better route to it.
      } else {
        # find relevant node in CLOSED
        I <- which(jind %in% setClosed)

        # update if we have a better route
        if (setClosedCosts[I] > cind) {
          costchart[setClosed[I]] <- cind
          setClosedCosts[I] = cind
          fieldpointers[setClosed[I]] <- movementdirections[jj]
        }
      }
    }
    # p <- findWayBack(goalposind,fieldpointers)
    #line(p[,2]+0.5,p[,1]+0.5)
    } # end of the for loop

    #Sys.sleep(1)
    #CreateChart(field,costchart,startposind,goalposind)
  }

  if (any(goalposind %in% setOpen)) {
    print('Solution found!')
    CreateChart(field,costchart,startposind,goalposind)

    p<- vessel_findWayBack(goalposind,fieldpointers,field)
    points(p[,2],p[,1],type="l",   lty=1, lwd=3)
  } else if (!any(goalposind %in% setOpen)){
    print('No Solution!')
  }
}

