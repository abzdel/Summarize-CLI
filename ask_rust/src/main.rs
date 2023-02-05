fn main() {
    // run python script ask.py from parent directory
    let output = std::process::Command::new("python")
        .arg("../../ask.py")
        .output()
        .expect("failed to execute process");

    // print output
    println!("{}", output.status);
}
