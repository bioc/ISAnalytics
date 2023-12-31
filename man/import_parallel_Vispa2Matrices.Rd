% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import-functions.R
\name{import_parallel_Vispa2Matrices}
\alias{import_parallel_Vispa2Matrices}
\title{Import integration matrices from paths in the association file.}
\usage{
import_parallel_Vispa2Matrices(
  association_file,
  quantification_type = c("seqCount", "fragmentEstimate"),
  matrix_type = c("annotated", "not_annotated"),
  workers = 2,
  multi_quant_matrix = TRUE,
  report_path = default_report_path(),
  patterns = NULL,
  matching_opt = matching_options(),
  mode = "AUTO",
  ...
)
}
\arguments{
\item{association_file}{Data frame imported via
\link{import_association_file} (with file system alignment)}

\item{quantification_type}{A vector of requested quantification_types.
Possible choices are \link{quantification_types}}

\item{matrix_type}{A single string representing the type of matrices
to be imported. Can only be one in "annotated" or "not_annotated".}

\item{workers}{A single integer representing the number of parallel
workers to use for the import}

\item{multi_quant_matrix}{If set to \code{TRUE} will produce a
multi-quantification matrix through \link{comparison_matrix}
instead of a list.}

\item{report_path}{The path where the report file should be saved.
Can be a folder or \code{NULL} if no report should be produced.
Defaults to \code{{user_home}/ISAnalytics_reports}.}

\item{patterns}{A character vector of additional patterns to match on file
names. Please note that patterns must be regular expressions. Can be \code{NULL}
if no patterns need to be matched.}

\item{matching_opt}{A single value between \link{matching_options}}

\item{mode}{Only \code{AUTO} is supported. As of \verb{ISAnalytics 1.8.3}, the value
\code{INTERACTIVE} is officially deprecated.}

\item{...}{<\code{\link[rlang:dyn-dots]{dynamic-dots}}> Additional named arguments
to pass to \code{comparison_matrix} and \code{import_single_Vispa2_matrix}}
}
\value{
Either a multi-quantification matrix or a list of integration
matrices
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}
The function offers a convenient way of importing multiple integration
matrices in an automated or semi-automated way.
For more details see the "How to use import functions" vignette:
\code{vignette("workflow_start", package = "ISAnalytics")}
}
\section{Required tags}{

The function will explicitly check for the presence of these tags:
\itemize{
\item project_id
\item vispa_concatenate
}
}

\examples{
fs_path <- generate_default_folder_structure(type = "correct")
af <- import_association_file(fs_path$af,
    root = fs_path$root,
    report_path = NULL
)
matrices <- import_parallel_Vispa2Matrices(af,
    c("seqCount", "fragmentEstimate"),
    mode = "AUTO", report_path = NULL
)
head(matrices)
}
\seealso{
Other Import functions: 
\code{\link{import_Vispa2_stats}()},
\code{\link{import_association_file}()},
\code{\link{import_single_Vispa2Matrix}()}
}
\concept{Import functions}
