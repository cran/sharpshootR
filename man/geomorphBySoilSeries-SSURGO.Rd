\name{geomorphBySoilSeries-SSURGO}
\alias{hillslope.probability}
\alias{hillslopeProbability}
\alias{surfaceShapeProbability}
\alias{geomPosHillProbability}
\alias{geomPosMountainProbability}
\title{Geomorphic Position Probability via SDA}
\description{Hillslope position probability estimates from the SDA query service (SSURGO)}
\usage{
hillslopeProbability(s, replaceNA=TRUE)
surfaceShapeProbability(s, replaceNA=TRUE)
geomPosHillProbability(s, replaceNA=TRUE)
geomPosMountainProbability(s, replaceNA=TRUE)
}
\arguments{
  \item{s}{a character vector of soil series names, automatically normalized to upper case}
  \item{replaceNA}{boolean: should missing classes be converted to probabilities of 0?}
}

\details{These functions send a query to the \href{http://sdmdataaccess.nrcs.usda.gov}{SDA} webservice. Further information on the SDA webservice and query examples can be found at \url{http://sdmdataaccess.nrcs.usda.gov/QueryHelp.aspx}}

\value{A \code{data.frame} object with rows representing soil series, and columns representing probability estimates of that series occurring at specified geomorphic positions or associated with a surface shape.}

\note{Probability values are computed from SSURGO data.}

\author{D.E. Beaudette}



\keyword{manip}

