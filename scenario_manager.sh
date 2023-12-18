#!/bin/bash

# Function to list available scenarios
list_scenarios() {
    local scenario_list=()
    local scenario_num=0

    echo "Available scenarios:"
    for scenario_dir in scenarios/*; do
        if [ -d "$scenario_dir" ]; then
            scenario_num=$((scenario_num + 1))
            scenario_name=$(basename "$scenario_dir")
            scenario_list+=("$scenario_name")
            echo "$scenario_num. $scenario_name"
        fi
    done

    # Return the list of scenario names as a space-separated string
    echo "${scenario_list[@]}"
}

# Function to run a selected scenario
run_scenario() {
    local selected_scenario="$1"
    local scenario_dir="scenarios/$selected_scenario"

    if [ -d "$scenario_dir" ]; then
        echo "Running scenario: $selected_scenario"
        cd "$scenario_dir" || return  # Change to the scenario directory

        # Add code to execute the scenario here
        # For example, start Docker containers or execute scripts
        ./start_scenario.sh  # Assuming a script to start the scenario

        # Provide instructions or information for participants
        cat instructions.txt  # Display scenario instructions (if available)

        cd -  # Return to the previous working directory
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
            scenario_list=($(list_scenarios))
            read -p "Enter the name or number of the scenario to run: " selected_scenario

            # Check if the selected_scenario is a number
            if [[ "$selected_scenario" =~ ^[0-9]+$ ]]; then
                # User entered a number, so retrieve the corresponding scenario name
                selected_scenario="${scenario_list[$selected_scenario - 1]}"
            fi

            run_scenario "$selected_scenario"  # Pass the selected scenario as an argument
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
