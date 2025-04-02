test_that("grep_read test", {
  tmp <- tempfile()
  writeLines(c("apple", "banana", "grape", "pineapple"), tmp)

  result <- grep_read("ap", tmp)
  expect_s3_class(result, "data.table")
  expect_equal(nrow(result), 3)
  expect_equal(result$line, c(1, 3, 4))

  empty_result <- grep_read("xyz", tmp)
  expect_s3_class(empty_result, "data.table")
  expect_equal(nrow(empty_result), 0)
})
