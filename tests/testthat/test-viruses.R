context("viruses")

test_that("", {
  skip_on_cran()
  data(viruses)
	expect_true(class(viruses$CreationDate) == 'Date')
  expect_true(class(viruses$ModificationDate) == 'Date')
  expect_true(all(viruses$ModificationDate < "2021-01-01"))
})




