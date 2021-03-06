% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{validate_f_out}
\alias{validate_f_out}
\title{Check \code{.f} output}
\usage{
validate_f_out(idx, len)
}
\arguments{
\item{idx}{(\code{logical}, \code{integer})}

\item{len}{(\code{integer}) length of \code{.then}}
}
\value{
\code{idx} if \code{logical} and \code{unique(idx)} if numeric.
}
\description{
Checks whether \code{.f} has needed length
}
\keyword{internal}
