fconvolution(lambda = 100,rate = 24, n = 10^6, p = .9999)

fconvolution <- function(lambda, rate, n, p){

  rp <- rpois(n,lambda = lambda)   # number of times late in a year

  for(i in 1:n){
    rp_i <- rp[i]
    severity_i <- rexp(rp_i, rate = 1/rate)
    severity[i] <- sum(severity_i)
  }
  mean_severity <- mean(severity)
  var_severity <- quantile(severity, p = p)
  unexpected_severity <- var_severity - mean_severity

  c(mean_severity = mean_severity,var_severity = var_severity, unexpected_severity = unexpected_severity)
}
##########################
# Functional Programming #
#########################

..convolution(rp_i = 100,rate = 10,n = 1000, p = .95)

..convolution <- function(rp_i,rate,n,p){
  severity_i <- rexp(rp_i, rate = 1/rate)
  severity <- sum(severity_i)
  return(severity)
  }


rp <- c(100,110,120)
.convolution(i = 2,rp = rp,rate = 10, n = 1000, p = .95)

.convolution <- function(i,rp,rate,n,p){
  rp_i <- rp[i]
  ..convolution(rp_i = rp_i,rate = rate,n = n,p = p)
}

convolution(lambda = 100,rate = 24, n = 10^6, p = .9999)

convolution <- function(lambda,rate, n, p){
  rp <- rpois(n,lambda = lambda)
  severity <- mclapply(X = 1:n,.convolution, rp, rate, n, p, mc.cores = 8)     # function that takes as input another function,
  severity <- unlist(severity)
  mean_severity <- mean(severity)
  var_severity <- quantile(severity, p = p)
  unexpected_severity <- var_severity - mean_severity
  out <- c(mean_severity = mean_severity,var_severity = var_severity, unexpected_severity = unexpected_severity)
  return(out)
}

##############################################################à
require(microbenchmark)
require(ggplot2)
require(parallel)

mc <- microbenchmark(
    for_loop = fconvolution(lambda = 100,rate = 24, n = 10^7, p = .9999),
    functional = convolution(lambda = 100,rate = 24, n = 10^7, p = .9999),
    times = 10
    )

