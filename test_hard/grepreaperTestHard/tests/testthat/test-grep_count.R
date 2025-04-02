test_that("grep_count counts correctly", {
  tmp <- tempfile()
  writeLines(c("apple", "grape", "banana", "pineapple"), tmp)

  # test function
  expect_equal(grep_count("ap", tmp), 3)

  # test complete match
  expect_equal(grep_count("xyz", tmp), 0)

  unlink(tmp)
})
