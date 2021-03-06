% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/patternTest.R
\name{patternTest}
\alias{patternTest}
\alias{patternTest,list-method}
\alias{patternTest,SingleCellExperiment-method}
\title{Assess differential expression pattern between lineages.}
\usage{
patternTest(models, ...)

\S4method{patternTest}{list}(
  models,
  global = TRUE,
  pairwise = FALSE,
  nPoints = 2 * nknots(models),
  l2fc = 0,
  eigenThresh = 0.01
)

\S4method{patternTest}{SingleCellExperiment}(
  models,
  global = TRUE,
  pairwise = FALSE,
  nPoints = 2 * nknots(models),
  l2fc = 0,
  eigenThresh = 0.01
)
}
\arguments{
\item{models}{The fitted GAMs, typically the output from
\code{\link{fitGAM}}.}

\item{...}{parameters including:}

\item{global}{If TRUE, test for all pairwise comparisons simultaneously.
If \code{models} contains conditions (i.e. \code{fitGAM} was run with the
conditions argument), then we compare the within-lineage average
across conditions, between lineages.}

\item{pairwise}{If TRUE, test for all pairwise comparisons, between lineages.}

\item{nPoints}{The number of points to be compared between lineages.
Defaults to twice the number of knots}

\item{l2fc}{The log2 fold change threshold to test against. Note, that
this will affect both the global test and the pairwise comparisons.}

\item{eigenThresh}{Eigenvalue threshold for deciding on the rank of the
variance-covariance matrix of the contrasts defined by `patternTest`, and
to use for calculating the Wald test statistics. Lower values
are more lenient to adding more information but also decrease computational stability.
This argument should in general not be changed by the user but is provided
for back-compatability. Set to \code{1e-8} to reproduce results of older
version of `tradeSeq`.}
}
\value{
A matrix with the wald statistic, the number of df and the p-value
 associated with each gene for all the tests performed. Also, for each possible
 pairwise comparision, the observed log fold changes. If the testing
 procedure was unsuccessful, the procedure will return NA test statistics,
 fold changes and p-values.
}
\description{
Assess differences in expression patterns between lineages.
}
\examples{
data(gamList, package = "tradeSeq")
patternTest(gamList, global = TRUE, pairwise = TRUE)
}
