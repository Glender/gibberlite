test_that("Test the is_gibberish function", {
  expect_equal(
    is_gibberish(c("asdfg", "The dog barked", "dfhgdfh", "I love to walk.")),
    c(TRUE, FALSE, TRUE, FALSE)
  )
})
