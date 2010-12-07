gm <- function(x){
  x;
}

vai <- function(lim = 10, c = 1){
  pos <- NULL;
  salto <- NULL;
  S <- 0;
  while(S < lim){
    S <- S + rexp(1, 1)
    if(S < lim){
      pos <- c(pos, S);
      y <- rgeom(1, 0.5) + 1;
      salto <- c(salto, rexp(1,1/gm(y)));
    }
  }
  pos
  salto

  plot.new()
  plot.window(xlim=c(0,lim), ylim=c(0,sum(salto)+c*lim))
  x <- 0;
  y <- 0;
  for(i in 1:length(salto)){
    segments(x, y, pos[i], y+(pos[i]-x)*c);
    x <- pos[i];
    y <- sum(salto[1:i])+c*x;
    print(c(x, y));
  }
  axis(1)
  axis(2)
}

