context("negative")

test_that("", {
  skip_on_cran()
  data(negative)
	expect_is(negative, "data.frame")
	expect_true(class(negative$CreationDate) == 'Date')
  expect_true(class(negative$ModificationDate) == 'Date')
  expect_true(all(negative$ModificationDate < "2021-01-01"))
})




