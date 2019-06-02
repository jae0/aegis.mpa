####################  
CreateChart<-function(field,costchart,startposind,goalposind){
# This function creates a pretty figure
    # If there is no figure open, then create one
    # if isempty(gcbf)
    #   f1 = figure('Position',[600 300 500 500],'Units','Normalized', ...
    #     'MenuBar','none');
    #   Caxes2 = axes('position', [0.01 0.01 0.98 0.98],'FontSize',12, ...
    #     'FontName','Helvetica');
    # else
    #   # get the current figure, and clear it
    #   gcf; cla;
    # end
   #dev.new()
    n <-  nrow(field)
    # plot field where walls are black, and everything else is white
                costchart <-costchart
        costchart[field == Inf]<- 5000
        costchart[is.na(costchart)]<-0

               #image(seq(1,n+1,1), seq(1,n+1,1), field, col =c("white","black"),  xaxs = "i", yaxs = "i")

    # set the colormap for the ploting the cost and looking really nice
colcount<- length(table(costchart))-2
jetpal<-rainbow(colcount, start = .15)
mypal<- c("#FFFFFF" ,jetpal,"#000000")
breakpoints <-  round(sort(c(unique(c(costchart)), 1000)),2) -0.01
breakpoints[length(breakpoints)]<-breakpoints[length(breakpoints)] + 0.01
    # make first entry be white, and last be black
    #   image(seq(1,n,1),seq(1,n,1), costchart, col = mypal,  xaxs = "i", yaxs = "i")

# x <- matrix(rnorm(9), nrow=3, ncol=3)
# y <- matrix(rnorm(9), nrow=3, ncol=3)
# COR <- cor(x,y)
# COR
# image(x=seq(dim(x)[2]), y=seq(dim(y)[2]), z=COR, xlab="x column", ylab="y column")
# text(expand.grid(x=seq(dim(x)[2]), y=seq(dim(y)[2])), labels=round(c(COR),2))
 image(seq(1,n,1),seq(1,n,1),  t(costchart), col = mypal,  breaks = breakpoints, xaxs = "i", yaxs = "i",xlab = "", ylab = "", axes = FALSE)

    # now plot the f values for all tiles evaluated
  
    # plot goal as a yellow square, and start as a green circle
    goalposy <- ((goalposind-1)%%n) +1
    goalposx <- floor((goalposind-1)/n) +1

    startposy <- ((startposind-1)%%n) +1
    startposx <- floor((startposind-1)/n) +1


    points(goalposx,goalposy,pch = 16,col = "black");
    points(startposx,startposy,pch = 16,col = "green");
   abline(v=c(seq(0+0.5,n+0.5,1)), h=c(seq(0+0.5,n+.5,1)))
  
 # end of this function 
}
