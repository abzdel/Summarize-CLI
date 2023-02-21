use std::fs::File;
use std::fs;


fn main() -> std::io::Result<()> {
    // open user file - text to be summarized by tool
    // need to convert it to json
    let txt_file = fs::read("corpus.txt").expect("Unable to read file - make sure there is a file named 'corpus.txt' in the same directory as this program.");
    //let contents = String::new();
    let contents = String::from_utf8_lossy(&txt_file);
    let contents = format!("{}", contents);

    let mut output = String::from("{'inputs': '");
    output.push_str(&contents);
    output.push_str("' }");

    //println!("{}", contents); // for testing

    //create json file for output
    let mut json_file = File::create("corpus.json")?;

    fs::write("corpus.json", output).expect("Unable to write file");

    //write!(json_file, "{}", contents);

    //fs::write("corpus.json", "{ 'inputs':")?;
    //fs::write("corpus.json", contents)?;
    //fs::write("corpus.json", contents).expect("Unable to write file");
    //fs::write("corpus.json", "}")?;
    Ok(())
}