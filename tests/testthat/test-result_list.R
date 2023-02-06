test_that("test result_list handling", {
  
  is_result = function(x) is.list(x) && identical(names(x),c("ok","err"))
  testthat::skip_if(
    !tryCatch(is_result(hello_extendr_error(1L)),error=function(e) FALSE),
    "not testing extendr result_list feature, if not enabled"
  )
  
  
  
  expect_equal(
    list(
     err = hello_extendr_error(1L),
     ok = hello_extendr_error(0L)
   ),
    list(err = list(ok = NULL, err = "imma extendr error"), ok = list(
    ok = "nothing to see here, carry on", err = NULL))
  )
  
  
  expect_equal(
    list(
     err1 = hello_string_error(1L),
     err2 = hello_string_error(2L),
     err3 = hello_string_error(3L),
     ok = hello_extendr_error(0L)
  ),
   list(err1 = list(ok = NULL, err = "imma string error msg"), err2 = list(
    ok = NULL, err = "imma extendr error"), err3 = list(ok = NULL, 
    err = "debug view 1.4142135623730951"), ok = list(ok = "nothing to see here, carry on", 
    err = NULL))
  )
  
  
   expect_equal(
    list(
     err1 = hello_robj_error(1L),
     err2 = hello_robj_error(2L),
     err3 = hello_robj_error(3L),
     ok = hello_robj_error(0L)
  ),
   list(err1 = list(ok = NULL, err = "imma string error msg"), err2 = list(
    ok = NULL, err = "imma extendr error"), err3 = list(ok = NULL, 
    err = 1.4142135623731), ok = list(ok = 42L, err = NULL))
  )
    
  
})
