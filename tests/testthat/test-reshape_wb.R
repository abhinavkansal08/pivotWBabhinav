test_that("reshape_wb works correctly", {
  file <- system.file("extdata", "maternal_mortality.csv", package = "pivotWBabhinav")
  df <- reshape_wb(file, "maternal_mortality")

  expect_true("year" %in% names(df))
  expect_true(is.numeric(df$year))
  expect_gt(nrow(df), ncol(df))
  expect_true("maternal_mortality" %in% names(df))
})
