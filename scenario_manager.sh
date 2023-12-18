#!/bin/bash

# Function to list available scenarios
list_scenarios() {
    echo "Available scenarios:"
    for scenario_dir in scenarios/*; do
        if [ -d "$scenario_dir" ]; then
            echo "$(basename $scenario_dir)"
        fi
    done
}

# Function to run a selected scenario
run_scenario() {
    local selected_scenario="$1"
    local scenario_dir="scenarios/$selected_scenario"

    if [ -d "$scenario_dir" ]; then
        echo "Running scenario: $selected_scenario"
        # Add code to execute the scenario here
        # For example, you can start the FTP server container
        docker run -d -p 2121:21 --name ftp_server stilliard/pure-ftpd
    else
        echo "Scenario not found: $selected_scenario"
    fi
}

# Main menu
echo "Welcome to the Scenario Manager"
while true; do
    echo "Select an option:"
    echo "1. List available scenarios"
    echo "2. Run a scenario"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            list_scenarios
            ;;
        2)
            read -p "Enter the name of the scenario to run: " selected_scenario
            run_scenario "$selected_scenario"
            ;;
        3)
            echo "Exiting Scenario Manager"
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done