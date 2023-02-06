test_that("test result_condition handling", {
  
  testthat::skip_if(
    !tryCatch(inherits( hello_extendr_error(1L),"condition"),error=function(e) FALSE),
    "not testing extendr result_condition feature, if not enabled"
  )
  

  expect_equal(
    list(
     err1 = hello_extendr_error(1L),
     ok1 = hello_extendr_error(0L)
   ),
    list(
      err1 = structure(
        list(message = "imma extendr error", value = "imma extendr error"),
        class = c("error", "condition")),
      ok1 = "nothing to see here, carry on")
  )
  
  #string errors
  expect_equal(
    list(
     err1 = hello_string_error(1L),
     err2 = hello_string_error(2L),
     err3 = hello_string_error(3L),
     ok1 = hello_extendr_error(0L)
    ),
    list(
      err1 = structure(
        list(message = "imma string error msg", value = "imma string error msg"),
        class = c("error", "condition")
      ),
      err2 = structure(
        list(message = "imma extendr error", value = "imma extendr error"),
        class = c("error", "condition")),
      err3 = structure(
        list(message = "debug view 1.4142135623730951", value = "debug view 1.4142135623730951"),
        class = c("error", "condition")),
      ok1 = "nothing to see here, carry on"
    )
  )
  
  
   expect_equal(
    list(
     err1 = hello_robj_error(1L),
     err2 = hello_robj_error(2L),
     err3 = hello_robj_error(3L),
     ok = hello_robj_error(0L)
  ),
   list(err1 = structure(list(message = "imma string error msg", 
    value = "imma string error msg"), class = c("error", "condition"
   )),
   err2 = structure(list(message = "imma extendr error", value = "imma extendr error"), class = c("error", 
    "condition")), err3 = structure(list(message = "extendr non-string error placed in cond$value", 
    value = 1.4142135623731), class = c("error", "condition")), 
    ok = 42L)
  )
    
  
})


