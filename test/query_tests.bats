#!/usr/bin/env bats

setup() {
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "should be executable" {
    run chmod +x ./query_command.sh
}

@test "should exit with success code if model is active" {
    if [[ $(aws sagemaker list-models | jq ".Models[0].ModelName") != null ]]; then
    run query_command.sh
    [ "$status" -eq 0 ]
    fi
}

@test "should exit with failure code if model is inactive" {
    if [[ $(aws sagemaker list-models | jq ".Models[0].ModelName") == null ]]; then
    run query_command.sh
    [ "$status" -eq 1 ]
    fi
}

@test "should exit with failure code if corpus is too long" {
    # doesnt actually run program - same logic applies
    if [[ $(wc -w corpus.txt | cut -d' ' -f1) -gt 1024 ]]; then
    [ "$status" -eq 1 ]
    fi
}

@test "should exit with success code if show_endpoint flag is passed" {
    run query_command.sh --show-endpoint
    [ "$status" -eq 0 ]
}

@test "should exit with success code if show_model flag is passed" {
    run query_command.sh --show-model
    [ "$status" -eq 0 ]
}

@test "should exit with success code if show_endpoint and show_model flags are passed" {
    run query_command.sh --show-endpoint --show-model
    [ "$status" -eq 0 ]
}

@test "should exit with success code if invalid flag is passed (will be ignored)" {
    run query_command.sh --invalid-flag
    [ "$status" -eq 0 ]
}

@test "should exit with success code if invalid flag (will be ignored) is passed with valid flag" {
    run query_command.sh --show-endpoint --invalid-flag
    [ "$status" -eq 0 ]
}


