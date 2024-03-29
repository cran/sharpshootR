% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FFD.R
\name{FFDplot}
\alias{FFDplot}
\title{Plot output from FFD()}
\usage{
FFDplot(s, sub.title = NULL)
}
\arguments{
\item{s}{output from \code{\link{FFD}}, with \code{returnDailyPr = TRUE}}

\item{sub.title}{figure subtitle}
}
\value{
nothing, function is called to generate graphical output
}
\description{
Plot output from FFD()
}
\examples{

# 11 years of data from highland meadows
data('HHM', package = 'sharpshootR')
x.ffd <- FFD(HHM, returnDailyPr = TRUE, frostTemp=32)

FFDplot(x.ffd)

}
