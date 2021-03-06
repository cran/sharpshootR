\name{SoilTaxonomyDendrogram}
\alias{SoilTaxonomyDendrogram}

\title{Soil Taxonomy Dendrogram}
\description{Plot a dendrogram based on the first 4 levels of Soil Taxonomy, with soil profiles hanging below. A dissimmilarity matrix is computed using Gower's distance metric for nominal-scale variables, based on order, sub order, great group, and subgroup level taxa. See the Details and Examples sections below for more information.}
\usage{
SoilTaxonomyDendrogram(spc, name = "hzname", name.style = "right-center",
                   rotationOrder = NULL, max.depth = 150, n.depth.ticks =
                   6, scaling.factor = 0.015, cex.names = 0.75, cex.id =
                   0.75, axis.line.offset = -4, width = 0.1, y.offset =
                   0.5, shrink = FALSE, font.id = 2, cex.taxon.labels =
                   0.66, dend.color = par("fg"), dend.width = 1, ...)
}

\arguments{
  \item{spc}{a \code{SoilProfileCollection} object, see details}
  \item{name}{column name containing horizon names}
  \item{name.style}{name.style for \code{plotSPC} (default: "right-center")}
  \item{rotationOrder}{numeric vector with desired ordering of leaves in the dendrogram from left to right, see details}
  \item{max.depth}{depth at which profiles are truncated for plotting}
  \item{n.depth.ticks}{suggested number of ticks on the depth axis}
  \item{scaling.factor}{scaling factor used to convert depth units into plotting units}
  \item{cex.names}{character scaling for horizon names}
  \item{cex.id}{character scaling for profile IDs}
  \item{axis.line.offset}{horizontal offset for depth axis}
  \item{width}{width of profiles}
  \item{y.offset}{vertical offset between dendrogram and profiles}
  \item{shrink}{should long horizon names be shrunk by 80\% ?}
  \item{font.id}{font style applied to profile id, default is 2 (bold)}
  \item{cex.taxon.labels}{character scaling for taxonomic information}
  \item{dend.color}{dendrogram line color}
  \item{dend.width}{dendrogram line width}
  \item{...}{additional arguments to plotSPC}
}

\details{This function looks for specific site-level attributes named: \code{soilorder}, \code{suborder}, \code{greatgroup}, and \code{subgroup}.

The \code{rotationOrder} argument uses (i.e. requires) the \code{dendextend::rotate()} function to re-order leaves within the \code{hclust} representation of the ST hierarchy. Perfect sorting is not always possible.
}

\value{An invisibly-returned list containing:
\describe{
\item{\code{dist}}{pair-wise dissimilarity matrix}
\item{\code{order}}{final ordering of hclust leaves}
}
}

\references{
D.E. Beaudette, P. Roudier and A.T. O'Geen. 2012. Algorithms for Quantitative Pedology, a Toolkit
for Soil Scientists. Computers & Geosciences: 52: 258--268. (doi: 10.1016/j.cageo.2012.10.020)
}

\author{D.E. Beaudette}

\examples{
\donttest{

if(requireNamespace("curl") &
   curl::has_internet() &
   require(aqp) &
   require(soilDB)
) {
  
  

# soils of interest
s.list <- c('musick', 'cecil', 'drummer', 'amador', 'pentz', 'reiff', 
'san joaquin','montpellier','grangeville','pollasky','ramona')

# fetch and convert data into an SPC
h <- fetchOSD(s.list)

# plot dendrogram + profiles
SoilTaxonomyDendrogram(h)

# again, this time save the pair-wise dissimilarity matrix
# note that there isn't a lot of discrimination between soils
(d <- SoilTaxonomyDendrogram(h))


# a different set
soils <- c('cecil', 'altavista', 'lloyd', 'wickham', 'wilkes',
'chewacla', 'congaree')

# get morphology + extended summaries for sorting of dendrogram
s <- fetchOSD(soils, extended = TRUE)

# get summary and ignore the figure
res <- vizHillslopePosition(s$hillpos)

# compare default sorting to soils sorting according to catenary, e.g.
# hillslope position
par(mar=c(0,0,1,1), mfrow=c(2,1))

SoilTaxonomyDendrogram(s$SPC, width=0.25)
mtext('default sorting', side = 2, line=-1, font=3, cex=1.25)

SoilTaxonomyDendrogram(s$SPC, rotationOrder = res$order, width=0.25)
mtext('approx. catenary sorting', side = 2, line=-1, font=3, cex=1.25)
  
}


}
}

\keyword{hplots}

