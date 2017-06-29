context("charter to school tests")

test_that("charter to school works on vector length 1", {

  expect_equal(ppn_charter_to_school('GPLES', 1), 'GPLESE')

})


test_that("charter to school works on vector length greater than 1", {

  expect_equal(
    ppn_charter_to_school(
      charter = c('GPLES', 'GPLES'),
      grade = c(1, 5)
    ),
    c('GPLESE', 'GPLESM')
  )

})


test_that("charter to school does 5th grade correctly", {

  expect_equal(
    ppn_charter_to_school(
      charter = c('GPLES', 'GPBX'),
      grade = c(5, 5)
    ),
    c('GPLESM', 'GPBXE')
  )

})
