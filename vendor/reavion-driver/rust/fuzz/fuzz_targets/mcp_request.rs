#![no_main]

use libfuzzer_sys::fuzz_target;

fuzz_target!(|data: &[u8]| reavion_driver_testkit::boundary_fuzz::mcp_request(data));
