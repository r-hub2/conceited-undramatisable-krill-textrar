% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textra.R
\name{post_request}
\alias{post_request}
\title{Send a POST request to the API}
\usage{
post_request(params, text)
}
\arguments{
\item{params}{A list of parameters to be passed to the API.}

\item{text}{The text to be translated.}
}
\value{
The response from the API.
}
\description{
This function sends a POST request to the API
with the specified parameters and text.
}
\examples{
\dontrun{
post_request(params = , text = "Hello, world!")
}

}
