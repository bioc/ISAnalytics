% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting-functions.R
\name{sharing_venn}
\alias{sharing_venn}
\title{Produce tables to plot sharing venn or euler diagrams.}
\usage{
sharing_venn(sharing_df, row_range = NULL, euler = TRUE)
}
\arguments{
\item{sharing_df}{The sharing data frame}

\item{row_range}{Either \code{NULL} or a numeric vector of row indexes (e.g.
\code{c(1, 4, 5)} will produce tables only for rows 1, 4 and 5)}

\item{euler}{If \code{TRUE} will produce tables for euler diagrams, otherwise
will produce tables for venn diagrams}
}
\value{
A list of data frames
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}
This function processes a sharing data frame obtained via \code{is_sharing()}
with the option \code{table_for_venn = TRUE} to obtain a list of objects
that can be plotted as venn or euler diagrams.
}
\details{
The functions requires the package
\href{https://jolars.github.io/eulerr/index.html}{eulerr}. Each row of the
input data frame is representable as a venn/euler diagram. The function
allows to specify a range of row indexes to obtain a list of plottable
objects all at once, leave it to NULL to process all rows.

To actually plot the data it is sufficient to call the function \code{plot()}
and specify optional customization arguments. See
\href{https://jolars.github.io/eulerr/reference/plot.euler.html}{eulerr docs}
for more detail on this.
}
\examples{
data("integration_matrices", package = "ISAnalytics")
data("association_file", package = "ISAnalytics")
aggreg <- aggregate_values_by_key(
    x = integration_matrices,
    association_file = association_file,
    value_cols = c("seqCount", "fragmentEstimate")
)
sharing <- is_sharing(aggreg, n_comp = 3, table_for_venn = TRUE)
venn_tbls <- sharing_venn(sharing, row_range = 1:3, euler = FALSE)
venn_tbls
plot(venn_tbls[[1]])
}
\seealso{
Other Plotting functions: 
\code{\link{CIS_volcano_plot}()},
\code{\link{HSC_population_plot}()},
\code{\link{circos_genomic_density}()},
\code{\link{fisher_scatterplot}()},
\code{\link{integration_alluvial_plot}()},
\code{\link{sharing_heatmap}()},
\code{\link{top_abund_tableGrob}()},
\code{\link{top_cis_overtime_heatmap}()}
}
\concept{Plotting functions}
