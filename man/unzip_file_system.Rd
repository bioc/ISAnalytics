% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility-functions.R
\name{unzip_file_system}
\alias{unzip_file_system}
\title{A utility function to unzip and use example file systems included in the
package}
\usage{
unzip_file_system(zipfile, name)
}
\arguments{
\item{zipfile}{The zipped file to decompress}

\item{name}{The name of the folder in the zipped archive ("fs" or "fserr")}
}
\value{
A path to reference
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}
From \verb{ISAnalytics 1.5.4} this function is defunct, since the package
doesn't include example tabular files anymore. Use the function
\code{generate_default_folder_structure()} to generate a default folder
structure for running tests and play with the package import functions.
If you don't need to test import functions, you can simply load
package included data via \code{data("integration_matrices")} or
\code{data("association_file")}.
}
\keyword{internal}
