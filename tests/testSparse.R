## Test1 -----------------------------------------------------------------------
suppressMessages(library(Matrix))
i <- sample(1:100, 20)
j <- sample(1:100, 20)
x <- rnorm(20)
A <- sparseMatrix(dims = c(100,100), i, j, x = x) 
print(A)
b <- rep(1, 100)
crossprod(A,b)

## Test2 -----------------------------------------------------------------------
sim <- simulateVAR(N = 100)

trDt <- transformData(sim$series, 1, list())

X <- as(trDt$X, "dgCMatrix")
y <- trDt$y

Rcpp::sourceCpp(file = "/home/svazzole/workspace/r/sparsevar/src/scad.cpp")
z <- sparsevar::crossprod(X,y)
z <- crossprod(X,y)
