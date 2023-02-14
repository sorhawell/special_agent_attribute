run_bench = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(100,100),helloextendr:::hello_extendr_error)
    },
    "hello_string_error_0" = {
      out = lapply(rep(100,100),helloextendr:::hello_string_error)
    },
    "hello_robj_error_0" = {
      out = lapply(rep(100,100), helloextendr:::hello_robj_error)
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

run_bench_error = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(c(1:2,1:2,rep(1:2,50)),helloextendr:::hello_extendr_error)
    },
    "hello_string_error_0" = {
      out = lapply(c(1:4,rep(1:4,25)),helloextendr:::hello_string_error)
    },
    "hello_robj_error_0" = {
      out = lapply(c(1:4,rep(1:4,25)), helloextendr:::hello_robj_error)
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

f_extendr_error = \(handler) 
f_string_error = \(handler) lapply(c(rep(1:4,25)),\(x) helloextendr:::hello_string_error(x) |> handler())
f_robj_error = \(handler) lapply(rep(1:4,25), \(x) helloextendr:::hello_robj_error(x) |> handler())

run_bench_list = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(1:2,50), function(x) unwrap_list(hello_extendr_error(x)))
    },
    "hello_string_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_list(hello_string_error(x)))
    },
    "hello_robj_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_list(hello_robj_error(x)))
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

run_bench_list_faster = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(1:2,50), function(x) unwrap_list_faster(hello_extendr_error(x)))
    },
    "hello_string_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_list_faster(hello_string_error(x)))
    },
    "hello_robj_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_list_faster(hello_robj_error(x)))
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

run_bench_list_even_faster = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(1:2,50), function(x) unwrap_even_faster(hello_extendr_error(x)))
    },
    "hello_string_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_even_faster(hello_string_error(x)))
    },
    "hello_robj_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_even_faster(hello_robj_error(x)))
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

run_bench_list_even_faster = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(1:2,50), function(x) unwrap_even_faster(hello_extendr_error(x)))
    },
    "hello_string_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_even_faster(hello_string_error(x)))
    },
    "hello_robj_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_even_faster(hello_robj_error(x)))
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

run_bench_attr = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(1:2,50), function(x) unwrap_attr(hello_extendr_error(x)))
    },
    "hello_string_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_attr(hello_string_error(x)))
    },
    "hello_robj_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_attr(hello_robj_error(x)))
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}

run_bench_cond = function() {
  rbenchmark::benchmark(
    "hello_extendr_error_0" = {
      out = lapply(rep(1:2,50), function(x) unwrap_condition(hello_extendr_error(x)))
    },
    "hello_string_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_condition(hello_string_error(x)))
    },
    "hello_robj_error_0" = {
      out = lapply(rep(1:4,25), function(x) unwrap_condition(hello_robj_error(x)))
    },
    replications = 5000,
    columns = c("test", "replications", "elapsed",
                "relative", "user.self", "sys.self")
  )
}
