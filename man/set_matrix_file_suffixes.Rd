% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility-functions.R
\name{set_matrix_file_suffixes}
\alias{set_matrix_file_suffixes}
\title{Sets the look-up table for matrix file suffixes.}
\usage{
set_matrix_file_suffixes(
  quantification_suffix = list(seqCount = "seqCount", fragmentEstimate =
    "fragmentEstimate", barcodeCount = "barcodeCount", cellCount = "cellCount", ShsCount
    = "ShsCount"),
  annotation_suffix = list(annotated = ".no0.annotated", not_annotated = ""),
  file_ext = "tsv.gz",
  glue_file_spec = "{quantification_suffix}_matrix{annotation_suffix}.{file_ext}"
)
}
\arguments{
\item{quantification_suffix}{A named list - names must be quantification
types in \code{quantification_types()}, and values must be single strings,
containing the associated suffix. Please note that ALL quantification
types must be specified or the function will produce an error.}

\item{annotation_suffix}{A named list - names must be \code{annotated} and
\code{not_annotated}, values must be single strings,
containing the associated suffix. Please note that both names must be
present in the list or the function will produce an error.}

\item{file_ext}{The file extension (e.g. \code{tsv}, \code{tsv.gz})}

\item{glue_file_spec}{A string specifying the pattern used to form the
entire suffix, as per \code{\link[glue:glue]{glue::glue()}} requirements.
The string should contain the reference to \code{quantification_suffix},
\code{annotation_suffix} and \code{file_ext}.}
}
\value{
\code{NULL}
}
\description{
The function automatically produces and sets a look-up table of matrix file
suffixes based on user input.
}
\examples{
set_matrix_file_suffixes(
    quantification_suffix = list(
        seqCount = "sc",
        fragmentEstimate = "fe",
        barcodeCount = "barcodeCount",
        cellCount = "cellCount",
        ShsCount = "ShsCount"
    ),
    annotation_suffix = list(annotated = "annot", not_annotated = "")
)
matrix_file_suffixes()
reset_matrix_file_suffixes()
}
\seealso{
Other dynamic vars: 
\code{\link{inspect_tags}()},
\code{\link{mandatory_IS_vars}()},
\code{\link{pcr_id_column}()},
\code{\link{reset_mandatory_IS_vars}()},
\code{\link{set_mandatory_IS_vars}()}
}
\concept{dynamic vars}
