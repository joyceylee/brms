% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/brmsfit-methods.R
\name{pp_check.brmsfit}
\alias{pp_check.brmsfit}
\alias{pp_check}
\title{Posterior Predictive Checks for \code{brmsfit} Objects}
\usage{
\method{pp_check}{brmsfit}(object, type, nsamples, group = NULL,
  x = NULL, newdata = NULL, resp = NULL, subset = NULL, ...)
}
\arguments{
\item{object}{An object of class \code{brmsfit}.}

\item{type}{Type of the ppc plot as given by a character string.
See \code{\link[bayesplot:PPC-overview]{PPC}} for an overview
of currently supported types. You may also use an invalid
type (e.g. \code{type = "xyz"}) to get a list of supported 
types in the resulting error message.}

\item{nsamples}{Positive integer indicating how many
posterior samples should be used.
If \code{NULL} all samples are used. If not specified,
the number of posterior samples is chosen automatically.
Ignored if \code{subset} is not \code{NULL}.}

\item{group}{Optional name of a factor variable in the model
by which to stratify the ppc plot. This argument is required for
ppc \code{*_grouped} types and ignored otherwise.}

\item{x}{Optional name of a variable in the model. 
Only used for ppc types having an \code{x} argument 
and ignored otherwise.}

\item{newdata}{An optional data.frame for which to evaluate predictions.
If \code{NULL} (default), the original data of the model is used.}

\item{resp}{Optional names of response variables.
If specified, fitted values of these response variables are returned.}

\item{subset}{A numeric vector specifying
the posterior samples to be used. 
If \code{NULL} (the default), all samples are used.}

\item{...}{Further arguments passed to \code{\link{predict.brmsfit}}
as well as to the PPC function specified in \code{type}.}
}
\value{
A ggplot object that can be further
 customized using the \pkg{ggplot2} package.
}
\description{
Perform posterior predictive checks with the help
of the \pkg{bayesplot} package.
}
\details{
For a detailed explanation of each of the ppc functions, 
see the \code{\link[bayesplot:PPC-overview]{PPC}} 
documentation of the \pkg{\link[bayesplot:bayesplot]{bayesplot}} 
package.
}
\examples{
\dontrun{
fit <-  brm(count ~ log_Age_c + log_Base4_c * Trt_c
            + (1|patient) + (1|obs),
            data = epilepsy, family = poisson())

pp_check(fit)  # shows dens_overlay plot by default
pp_check(fit, type = "error_hist", nsamples = 11)
pp_check(fit, type = "scatter_avg", nsamples = 100)
pp_check(fit, type = "stat_2d")
pp_check(fit, type = "rootogram")
pp_check(fit, type = "loo_pit")

## get an overview of all valid types
pp_check(fit, type = "xyz")
}

}
