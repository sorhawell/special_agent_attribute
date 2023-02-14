unwrap_list_faster = function(result, call=sys.call(1L)) {
  #if not a result
  if(!class(result) =="extendr_result") {
    stop("Internal error: cannot unwrap non result")
  }

  #if result is ok (ok can be be valid null, hence OK if both ok and err is null)
  if(is.null(result$err)) {
    return(result$ok)
  }

  #if result is error, make a pretty with context
  if(is.null(result$ok)) {
    return(result$err)
  }

  #if not ok XOR error, then roll over
  stop("Internal error: result object corrupted")
}

unwrap_list = function(result, call=sys.call(1L)) {
  #if not a result
  if(!(is.list(result) && identical(names(result), c("ok","err")) && (is.null(result[[1L]]) || is.null(result[[2L]])))) {
    stop("Internal error: cannot unwrap non result")
  }

  #if result is ok (ok can be be valid null, hence OK if both ok and err is null)
  if(is.null(result$err)) {
    return(result$ok)
  }

  #if result is error, make a pretty with context
  if(is.null(result$ok) && !is.null(result$err)) {
    return("pretend to throw an error")
  }

  #if not ok XOR error, then roll over
  stop("Internal error: result object corrupted")
}


unwrap_attr = function(result, call=sys.call(1L)) {
  if(isTRUE(attr(result,"extendr_err"))) {
    "this is an error"
  } else {
    result  
  }
}

unwrap_condition = function(result, call=sys.call(1L)) {
  if(isTRUE(class(result) == c("error", "condition"))) {
    "this is an error"
  } else {
    result  
  }
}