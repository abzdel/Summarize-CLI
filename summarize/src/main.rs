//use onnxruntime::environment::Environment;
//use onnxruntime::environment::LoggingLevel;
//use onnxruntime::session::GraphOptimizationLevel;

use onnxruntime::session::SessionBuilder;

use onnxruntime::{
    environment::Environment, ndarray::Array, tensor::OrtOwnedTensor, GraphOptimizationLevel,
    LoggingLevel,
};


fn main() {
    let environment = Environment::builder()
        .with_name("test")
        .with_log_level(LoggingLevel::Info)
        .build();

    /* create session and load in model from onnx model zoo
    refer to documentation to load in model locally
    may want to host model on azure in the future - will have to adjust the following to reflect this

    not currently working - MachineComprehension not being recognized. unsure how to pull model in from onnx model zoo
    will load model in locally for now to achieve a minimum viable product
    // let mut session = environment
    //     .new_session_builder()?
    //     .with_optimization_level(GraphOptimizationLevel::Basic)?
    //     .with_number_threads(1)?
    //     .with_model_downloaded(MachineComprehension::T5)?;
    */

    let mut session = environment
        .new_session_builder()?
        .with_optimization_level(GraphOptimizationLevel::Basic)
        .with_number_threads(1)
        .with_model_from_file("../model/model.onnx");

}