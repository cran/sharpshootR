% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-documentation.R
\docType{data}
\name{table5.2}
\alias{table5.2}
\title{Table 5.2 from Hole and Campbell, 1985.}
\format{
An object of class \code{matrix} (inherits from \code{array}) with 18 rows and 18 columns.
}
\usage{
data(table5.2)
}
\description{
An adjacency matrix describing shared soil map boundary segments from the Soil Survey of Shawnee county, KS. This is table 5.2 from Hole and Campbell, 1985.
}
\examples{

data("table5.2")

if(requireNamespace("igraph")) {
  
  # note special incantation to get the "correct" graph structure
  g <- igraph::graph_from_adjacency_matrix(table5.2, mode = 'upper', diag = FALSE, weighted = TRUE)
  
  # visualize
  op <- par(no.readonly = TRUE)
  
  par(mar = c(0,0,0,0))
  plot(g)
  
  plot(g, vertex.size = sqrt(igraph::degree(g) * 25), vertex.label.family = 'sans')
  
  # find communities
  cm <- igraph::cluster_walktrap(g)
  plot(cm, g, vertex.label.family = 'sans')
  
  par(op)
}

}
\references{
Hole, F.D. and J.B. Campbell. Soil Landscape Analysis. Rowman and Allanheld, 1985.
}
\keyword{datasets}
