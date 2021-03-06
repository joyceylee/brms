% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/formula-helpers.R
\name{mi}
\alias{mi}
\title{Predictors with Missing Values in \pkg{brms} Models}
\usage{
mi(x)
}
\arguments{
\item{x}{The variable containing missings.}
}
\description{
Predictors with Missing Values in \pkg{brms} Models
}
\details{
For detailed documentation see \code{help(brmsformula)}. 

This function is almost solely useful when
called in formulas passed to the \pkg{brms} package.
}
\examples{
\dontrun{
data("nhanes", package = "mice")
bform <- bf(bmi | mi() ~ age * mi(chl)) +
  bf(chl | mi() ~ age) + set_rescor(FALSE)
fit <- brm(bform, data = nhanes)
summary(fit)
plot(marginal_effects(fit, resp = "bmi"), ask = FALSE)
LOO(fit, newdata = na.omit(fit$data))
} 

}
\seealso{
\code{\link{brmsformula}}
}
