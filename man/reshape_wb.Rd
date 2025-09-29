\name{reshape_wb}
\alias{reshape_wb}
\title{Reshape World Bank-Style Data}
\usage{
reshape_wb(file, value_name)
}
\arguments{
  \item{file}{Path to the CSV file containing the data.}
  \item{value_name}{Name for the reshaped variable (string).}
}
\value{
A tibble with columns: iso, country, indicator, year, and the reshaped values.
}
\description{
This function takes a World Bank dataset in wide format (years as columns)
and reshapes it into tidy long format with columns \code{year} and \code{value}.
}
\examples{
file <- system.file("extdata", "maternal_mortality.csv", package = "pivot_wb_data_abhinav")
reshape_wb(file, "maternal_mortality")
}
