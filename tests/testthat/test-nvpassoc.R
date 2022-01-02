context("nvpassoc")

test_that("", {
  skip_on_cran()
  data(nvpassoc)
	expect_is(nvpassoc, "data.frame")
})




