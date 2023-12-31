% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outlier-filtering.R
\name{outlier_filter}
\alias{outlier_filter}
\title{Filter out outliers in metadata, identified by the chosen outlier test.}
\usage{
outlier_filter(
  metadata,
  pcr_id_col = pcr_id_column(),
  outlier_test = c(outliers_by_pool_fragments),
  outlier_test_outputs = NULL,
  combination_logic = c("AND"),
  negate = FALSE,
  report_path = default_report_path(),
  ...
)
}
\arguments{
\item{metadata}{The metadata data frame}

\item{pcr_id_col}{The name of the pcr identifier column}

\item{outlier_test}{One or more outlier tests. Must be functions,
either from \code{available_outlier_tests()} or custom functions that
produce an appropriate output format (see details).}

\item{outlier_test_outputs}{\code{NULL}, a data frame or a list of data frames.
See details.}

\item{combination_logic}{One or more logical operators
("AND", "OR", "XOR", "NAND", "NOR", "XNOR"). See datails.}

\item{negate}{If \code{TRUE} will return only the metadata that was flagged to
be removed. If \code{FALSE} will return only the metadata that wasn't flagged
to be removed.}

\item{report_path}{The path where the report file should be saved.
Can be a folder or \code{NULL} if no report should be produced.
Defaults to \code{{user_home}/ISAnalytics_reports}.}

\item{...}{Additional named arguments passed to \code{outliers_test}}
}
\value{
A data frame of metadata which has less or the same amount of rows
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}
Filter out outliers in metadata by using appropriate outlier tests.
}
\details{
\subsection{Modular structure}{

The outlier filtering functions are structured in a modular fashion.
There are 2 kind of functions:
\itemize{
\item Outlier tests - Functions that perform some kind of calculation based
on inputs and flags metadata
\item Outlier filter - A function that takes one or more outlier tests,
combines all the flags with a given logic and filters out rows that
are flagged as outliers
}

This function acts as the filter. It can either take one or more outlier
tests as functions and call them through the argument \code{outlier_test},
or it can take directly outputs produced by individual tests in
the argument \code{outlier_test_outputs} - if both are provided the second one
has priority. The second method offers a bit more freedom, since single
tests can be run independently and intermediate results saved and examined
more in detail. If more than one test is to be performed, the argument
\code{combination_logic} tells the function how to combine the flags: you can
specify 1 logical operator or more than 1, provided it is compatible
with the number of tests.
}

\subsection{Writing custom outlier tests}{

You have the freedom to provide your own functions as outlier tests. For
this purpose, functions provided must respect this guidelines:
\itemize{
\item Must take as input the whole metadata df
\item Must return a df containing AT LEAST the \code{pcr_id_col} and a logical column
\code{"to_remove"} that contains the flag
\item The \code{pcr_id_col} must contain all the values originally present in the
metadata df
}
}
}
\examples{
data("association_file", package = "ISAnalytics")
filtered_af <- outlier_filter(association_file,
    key = "BARCODE_MUX",
    report_path = NULL
)
head(filtered_af)
}
\seealso{
Other Data cleaning and pre-processing: 
\code{\link{aggregate_metadata}()},
\code{\link{aggregate_values_by_key}()},
\code{\link{compute_near_integrations}()},
\code{\link{default_meta_agg}()},
\code{\link{outliers_by_pool_fragments}()},
\code{\link{purity_filter}()},
\code{\link{realign_after_collisions}()},
\code{\link{remove_collisions}()},
\code{\link{threshold_filter}()}
}
\concept{Data cleaning and pre-processing}
