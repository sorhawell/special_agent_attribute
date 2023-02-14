# #test 500 000 ok values, takes 1 sec for attribute and condition and 1.8 sec for result_list
# result_attribute
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   0.853    1.018     0.844    0.008
# 3    hello_robj_error_0         5000   0.846    1.010     0.840    0.006
# 2  hello_string_error_0         5000   0.838    1.000     0.825    0.012
# 
# result_condition
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   0.832    1.034     0.808    0.022
# 3    hello_robj_error_0         5000   0.816    1.014     0.814    0.002
# 2  hello_string_error_0         5000   0.805    1.000     0.804    0.001
# 
# > run_list
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   1.671    1.000     1.652    0.018
# 3    hello_robj_error_0         5000   1.741    1.042     1.718    0.022
# 2  hello_string_error_0         5000   1.692    1.013     1.689    0.003
# 
# result_panic
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   0.830    1.017     0.820    0.009
# 3    hello_robj_error_0         5000   0.816    1.000     0.805    0.012
# 2  hello_string_error_0         5000   0.979    1.200     0.975    0.004
# 
# 
# ##500 000 errors
# result_condition
#                   test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   1.756    1.000     1.736    0.020
# 3    hello_robj_error_0         5000   2.785    1.586     2.779    0.004
# 2  hello_string_error_0         5000   2.927    1.667     2.902    0.025
# 
# result_list
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   1.857    1.000     1.837    0.020
# 3    hello_robj_error_0         5000   2.413    1.299     2.410    0.003
# 2  hello_string_error_0         5000   2.618    1.410     2.596    0.023
# 
# result_attribute
# 1 hello_extendr_error_0         5000   1.248    1.000     1.238    0.010
# 3    hello_robj_error_0         5000   1.949    1.562     1.946    0.003
# 2  hello_string_error_0         5000   2.105    1.687     2.093    0.013
# 
# result_panic not tested as it would be super slow
# 
# 
# 
# #500 000 erros + handling
# 
# result_list 1.0
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   5.549    1.000     5.533    0.017
# 3    hello_robj_error_0         5000   6.389    1.151     6.362    0.026
# 2  hello_string_error_0         5000   6.694    1.206     6.684    0.012
# 
# result_list_fast 2.0  # use class to recognize result
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   5.086    1.000     5.054    0.033
# 3    hello_robj_error_0         5000   6.091    1.198     6.079    0.013
# 2  hello_string_error_0         5000   6.528    1.284     6.513    0.014
# 
# > run_bench_list_even_faster() #handling written in rust
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   3.247    1.000     3.226    0.021
# 3    hello_robj_error_0         5000   3.864    1.190     3.830    0.035
# 2  hello_string_error_0         5000   4.147    1.277     4.135    0.011
# 
# 
# run_bench_attr()
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   2.388    1.000     2.379    0.009
# 3    hello_robj_error_0         5000   3.383    1.417     3.376    0.008
# 2  hello_string_error_0         5000   3.461    1.449     3.446    0.015
# 
# run_bench_cond()
#                    test replications elapsed relative user.self sys.self
# 1 hello_extendr_error_0         5000   3.312    1.000     3.299    0.014
# 3    hello_robj_error_0         5000   4.423    1.335     4.416    0.008
# 2  hello_string_error_0         5000   4.741    1.431     4.716    0.018