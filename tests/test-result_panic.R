test_that("test result_condition handling", {
  
  rust_function_panicked = tryCatch({hello_extendr_error(1L); FALSE},error=function(e) TRUE)
  testthat::skip_if(
    !rust_function_panicked,
    "not testing extendr result_panic feature, if not enabled"
  )
  
  expect_error(hello_extendr_error(1L))
  expect_identical(hello_extendr_error(0L),"nothing to see here, carry on")
  
  expect_error(hello_string_error(1L))
  expect_error(hello_string_error(2L))
  expect_error(hello_string_error(3L))
  expect_identical(hello_extendr_error(0L),"nothing to see here, carry on")
  
  expect_error(hello_robj_error(1L))
  expect_error(hello_robj_error(2L))
  expect_error(hello_robj_error(3L))
  expect_identical(hello_extendr_error(0L),"nothing to see here, carry on")

  
})


