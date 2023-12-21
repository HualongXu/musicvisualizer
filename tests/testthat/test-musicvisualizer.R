test_that("musicvisualizer objects have elements", {
  expect_equal(length(musicvisualizer('Olivia Rodrigo', 'GUTS')), 6)
})

test_that("musicvisualzier objects are data frames", {
  expect_true(is.data.frame(musicvisualizer('Olivia Rodrigo', 'GUTS')))
})

test_that("musicvisualizer objects have class musicvisualizer", {
  expect_equal(class(musicvisualizer('Olivia Rodrigo', 'GUTS')), c("musicvisualizer","data.frame"))
})

library(vdiffr)

test_that("visualizing the first musicvisualizer features works", {
  expect_doppelganger(
    title = "musicvisualzier Olivia Rodrigo's GUTS",
    fig = plot(musicvisualizer('Olivia Rodrigo', 'GUTS'))
  )
})
