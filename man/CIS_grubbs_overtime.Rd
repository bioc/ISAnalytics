% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis-functions.R
\name{CIS_grubbs_overtime}
\alias{CIS_grubbs_overtime}
\title{Compute CIS and Grubbs test over different time points and groups.}
\usage{
CIS_grubbs_overtime(
  x,
  genomic_annotation_file = "hg19",
  grubbs_flanking_gene_bp = 1e+05,
  threshold_alpha = 0.05,
  group = "SubjectID",
  timepoint_col = "TimePoint",
  as_df = TRUE,
  return_missing_as_df = TRUE,
  max_workers = NULL
)
}
\arguments{
\item{x}{An integration matrix, must include the \code{mandatory_IS_vars()}
columns and the \code{annotation_IS_vars()} columns}

\item{genomic_annotation_file}{Database file for gene annotation,
see details.}

\item{grubbs_flanking_gene_bp}{Number of base pairs flanking a gene}

\item{threshold_alpha}{Significance threshold}

\item{group}{A character vector of column names that identifies a group.
Each group must contain one or more time points.}

\item{timepoint_col}{What is the name of the column containing time points?}

\item{as_df}{Choose the result format: if \code{TRUE} the results are returned
as a single data frame containing a column for the group id and a column
for the time point, if \code{FALSE} results are returned in the form of nested
lists (one table for each time point and for each group), if \code{"group"}
results are returned as a list separated for each group but containing a
single table with all time points.}

\item{return_missing_as_df}{Returns those genes present in the input df
but not in the refgenes as a data frame?}

\item{max_workers}{Maximum number of parallel workers. If \code{NULL} the
maximum number of workers is calculated automatically.}
}
\value{
A list with results and optionally missing genes info
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}
Computes common insertion sites and Grubbs test for each separate group
and separating different time points among the same group. The logic
applied is the same as the function \code{CIS_grubbs()}.
}
\details{
\subsection{Genomic annotation file}{

A data frame containing
genes annotation for the specific genome.
From version \verb{1.5.4} the argument \code{genomic_annotation_file} accepts only
data frames or package provided defaults.
The user is responsible for importing the appropriate tabular files if
customization is needed.
The annotations for the human genome (hg19) and
murine genome (mm9) are already
included in this package: to use one of them just
set the argument \code{genomic_annotation_file} to either \code{"hg19"} or
\code{"mm9"}.
If for any reason the user is performing an analysis on another genome,
this file needs to be changed respecting the USCS Genome Browser
format, meaning the input file headers should include:

name2, chrom, strand, min_txStart, max_txEnd, minmax_TxLen, average_TxLen, name, min_cdsStart, max_cdsEnd, minmax_CdsLen, average_CdsLen
}
}
\examples{
data("integration_matrices", package = "ISAnalytics")
data("association_file", package = "ISAnalytics")
aggreg <- aggregate_values_by_key(
    x = integration_matrices,
    association_file = association_file,
    value_cols = c("seqCount", "fragmentEstimate")
)
cis_overtime <- CIS_grubbs_overtime(aggreg)
cis_overtime
}
