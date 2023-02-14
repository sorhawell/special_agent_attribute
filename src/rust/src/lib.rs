use extendr_api::prelude::*;

/// @export
#[extendr]
fn hello_extendr_error(fail_type: i32) -> Result<Robj> {
    match fail_type {
        1 => Err(extendr_api::Error::Other("imma extendr error".into())),
        _ => Ok("nothing to see here, carry on".into()),
    }
}

#[extendr]
fn hello_string_error(fail_type: i32) -> std::result::Result<Robj, String> {
    match fail_type {
        1 => Err("imma string error msg".to_string().into()),
        2 => Err(extendr_api::Error::Other("imma extendr error".to_string()))?,
        3 => Err(format!("debug view {:?}", R!("sqrt(2)").unwrap())),
        _ => Ok(42.into()),
    }
}

/// @export
#[extendr]
fn hello_robj_error(fail_type: i32) -> std::result::Result<Robj, Robj> {
    match fail_type {
        1 => Err("imma string error msg".to_string().into()),
        2 => Err(extendr_api::Error::Other("imma extendr error".to_string()))?,
        3 => Err(R!("sqrt(2)").unwrap()),
        _ => Ok(42.into()),
    }
}

#[extendr]
fn unwrap_even_faster(result: Robj) -> Robj {
    match result.class().expect("a").next() {
        Some(s) if s == "extendr_result" => {
            let l = result.as_list().expect("c");
            let mut slc = l.as_slice().into_iter();
            match (slc.next(), slc.next()) {
                (Some(ok), Some(err)) => {
                    if err.is_null() {
                        return ok.clone();
                    };
                    if ok.is_null() {
                        return err.clone();
                    };
                    panic!("d")
                }
                (_, _) => panic!("e"),
            }
        }
        _ => panic!("f"),
    }
}

// Macro to generate exports.
// This ensures exported functions are registered with R.
// See corresponding C code in `entrypoint.c`.

extendr_module! {
    mod helloextendr;
    fn hello_extendr_error;
    fn hello_string_error;
    fn hello_robj_error;
    fn unwrap_even_faster;
}
