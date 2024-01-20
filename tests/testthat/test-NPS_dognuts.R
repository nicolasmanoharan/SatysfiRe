test_that("Generate Plotly", {
  expect_equal(any(class(NPS_Dognuts(c(1,2,10,4,3,6,7,8))) == "plotly"), TRUE)
})
