context("nematode")

test_that("wormy time", {
  skip_on_cran()
  data(nematode)
	expect_is(nematode, "data.frame")
	expect_true(class(nematode$CreationDate) == 'Date')
  expect_true(class(nematode$ModificationDate) == 'Date')
  expect_true(all(nematode$ModificationDate < "2021-01-01"))
})




