\name{Acf}
\alias{Acf}
\alias{Pacf}
\alias{Ccf}
\alias{taperedacf}
\alias{taperedpacf}
\title{(Partial) Autocorrelation and Cross-Correlation Function Estimation}
\usage{
Acf(x, lag.max = NULL,
  type = c("correlation", "covariance", "partial"),
  plot = TRUE, na.action = na.contiguous, demean=TRUE, ...)
Pacf(x, lag.max=NULL, 
  plot = TRUE, na.action = na.contiguous, demean=TRUE, ...)
Ccf(x, y, lag.max=NULL, type=c("correlation","covariance"),
  plot=TRUE, na.action=na.contiguous, ...)
taperedacf(x, lag.max=NULL, type=c("correlation", "partial"),
  plot=TRUE, calc.ci=TRUE, level=95, nsim=100, ...)
taperedpacf(x, ...) }

\arguments{
\item{x}{a univariate or multivariate (not Ccf) numeric time series object or a numeric vector or matrix.}
\item{y}{a univariate numeric time series object or a numeric vector.}
\item{lag.max}{maximum lag at which to calculate the acf. Default is $10*log10(N/m)$ where $N$ is the number of observations and $m$ the number of series. Will be automatically limited to one less than the number of observations in the series.}
\item{type}{character string giving the type of acf to be computed. Allowed values are
\dQuote{\code{correlation}} (the default), \dQuote{\code{covariance}}  or \dQuote{\code{partial}}.}
\item{plot}{logical. If \code{TRUE} (the default) the resulting acf, pacf or ccf is plotted.}
\item{na.action}{function to handle missing values. Default is \code{\link[stats]{na.contiguous}}.  Useful alternatives are \code{\link[stats]{na.pass}} and \code{\link{na.interp}}.}
\item{demean}{Should covariances be about the sample means?}
\item{calc.ci}{If \code{TRUE}, confidence intervals for the ACF/PACF estimates are calculated.}
\item{level}{Percentage level used for the confidence intervals.}
\item{nsim}{The number of bootstrap samples used in estimating the confidence intervals.}
\item{...}{Additional arguments passed to the plotting function.}
}

\description{The function \code{Acf} computes (and by default plots) an estimate of the autocorrelation function of a (possibly multivariate) time series. Function \code{Pacf} computes (and by default plots) an estimate of the partial autocorrelation function of a (possibly multivariate) time series. Function \code{Ccf} computes the cross-correlation or cross-covariance of two univariate series.}

\details{The functions improve the \code{\link[stats]{acf}}, \code{\link[stats]{pacf}} and \code{\link[stats]{ccf}} functions. The main differences are that \code{Acf} does not plot a spike at lag 0 when \code{type=="correlation"} (which is redundant) and the horizontal axes show lags in time units rather than seasonal units.

The tapered versions implement the ACF and PACF estimates and plots described in Hyndman (2015), based on the banded and tapered estimates of autocovariance proposed by McMurry and Politis (2010).
}

\references{
  Hyndman, R.J. (2015). Discussion of ``High-dimensional autocovariance matrices and optimal linear prediction''. \emph{Electronic Journal of Statistics}, 9, 792-796.

  McMurry, T. L., & Politis, D. N. (2010). Banded and tapered estimates for autocovariance matrices and the linear process bootstrap. \emph{Journal of Time Series Analysis}, 31(6), 471-482.
}

\value{The \code{Acf}, \code{Pacf} and \code{Ccf} functions return objects of class "acf" as described in \code{\link[stats]{acf}} from the stats package. The \code{taperedacf} and \code{taperedpacf} functions return objects of class "mpacf".}

\seealso{\code{\link[stats]{acf}}, \code{\link[stats]{pacf}}, \code{\link[stats]{ccf}}, \code{\link{tsdisplay}}}

\author{Rob J Hyndman}
\examples{
Acf(wineind)
Pacf(wineind)
\dontrun{
taperedacf(wineind, nsim=50)
taperedpacf(wineind, nsim=50)
}
}
\keyword{ts}