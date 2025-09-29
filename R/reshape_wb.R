#' Reshape World Bank-Style Data
#'
#' This function takes a World Bank dataset in wide format (years as columns)
#' and reshapes it into tidy long format with columns `year` and `value`.
#'
#' @param file Path to the CSV file containing the data.
#' @param value_name Name for the reshaped variable (string).
#'
#' @return A tibble with columns: iso, country, indicator, year, and the reshaped values.
#' @examples
#' file <- system.file("extdata", "maternal_mortality.csv", package = "pivotWBabhinav")
#' reshape_wb(file, "maternal_mortality")
#' @export
reshape_wb <- function(file, value_name) {
  df <- readr::read_csv(file, show_col_types = FALSE)

  df_long <- df %>%
    tidyr::pivot_longer(
      cols = dplyr::matches("^X[0-9]+"),
      names_to = "year",
      names_prefix = "X",
      values_to = value_name
    ) %>%
    dplyr::mutate(year = as.numeric(year))

  return(df_long)
}
