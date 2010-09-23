escolhe <- function(p){
  p <- p / sum(p);
  u <- runif(1);
  i <- 1;
  while(u > p[i]){
    u <- u - p[i];
    i <- i+1;
  }
  i;
}

vai <- function(lim = 10, c = 1){
  N <- 10;
  lmb <- rep(1, N);
  gm <- rep(1, N);
  y <- 3;

  pos <- c(0);
  salto <- rexp(1, 1/gm[y]);
  S <- 0;
  while(S < lim){
    S <- S + rexp(1, sum(lmb));
    if(S < lim){
      pos <- c(pos, S);
      y <- escolhe(lmb);
      salto <- c(salto, rexp(1,1/gm[y]));
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

