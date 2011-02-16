
vai <- function(yl = 0, xl = 10, l = 1, m = 1, semente){

  x <- 0;
  t <- 0;

  set.seed(semente);
  plot.new()
  plot.window(xlim=c(0,xl), ylim=c(0, yl))
  title(xlab="Tempo", ylab = "Clientes no banco");
  while(t < xl){
    y <- 0;
    if(x == 0){
      s <- rexp(1, l);
      y <- 1;
    } else{
      s <- rexp(1, l+m);
      y <- ifelse(runif(1) < l/(l+m), 1, -1);
    }

    segments(t, x, t+s, x);
    x <- x+y;
    t <- t+s;
  }
  axis(1, labels = FALSE)
  axis(2, at = 0:yl, labels=0:yl)
}


vai(l = 1, m = 1, xl = 2.5, yl = 4, semente = 42)



