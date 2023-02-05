test_that("play with errors", {
  
  expect_equal(
    list(
     err = hello_extendr_error(1L),
     ok = hello_extendr_error(0L)
   ),
    list(err = structure("imma extendr error", extendr_err = TRUE), 
    ok = "nothing to see here, cary on")
  )
  
  
  expect_equal(
    list(
     err1 = hello_string_error(1L),
     err2 = hello_string_error(2L),
     err3 = hello_string_error(3L),
     ok = hello_extendr_error(0L)
  ),
   list(err1 = structure("imma string error msg", extendr_err = TRUE), 
    err2 = structure("imma extendr error", extendr_err = TRUE), 
    err3 = structure("debug view 1.4142135623730951", extendr_err = TRUE), 
    ok = "nothing to see here, cary on")
  )
  
  
   expect_equal(
    list(
     err1 = hello_robj_error(1L),
     err2 = hello_robj_error(2L),
     err3 = hello_robj_error(3L),
     ok = hello_robj_error(0L)
  ),
   list(err1 = structure("imma string error msg", extendr_err = TRUE), 
    err2 = structure("imma extendr error", extendr_err = TRUE), 
    err3 = structure(1.4142135623731, extendr_err = TRUE), ok = 42L)
  )
    
  
})
