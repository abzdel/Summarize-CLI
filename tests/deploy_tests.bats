#!/usr/bin/env bats
# write test cases for './summarize deploy' command

load test_helper

SUMMARIZE_SCRIPT="../src/deploy_command.sh"

@test "should be executable" {
    run chmod +x $SUMMARIZE_SCRIPT
    [ "$status" -eq 0 ]

}

@test "should output a success message" {
    run $SUMMARIZE_SCRIPT
    [ "$status" -eq 0 ]
    [ "$output" = "model deployed successfully" ]
}

@