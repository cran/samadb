
data <- tryCatch(sm_data("ELECTRICITY", from = 2000), error = function(e) NULL)

if(length(data) && fnrow(data) > 1L) test_that("reshaping works", {

  expect_equal(data, sm_pivot_wider(sm_pivot_longer(data)))

})
