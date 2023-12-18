#!/bin/bash

# Check if a scenario name is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <scenario_name>"
    exit 1
fi

# Extract the scenario name from the argument
selected_scenario="$1"

# Check if the selected scenario directory exists
scenario_dir="scenarios/$selected_scenario"
if [ ! -d "$scenario_dir" ]; then
    echo "Scenario not found: $selected_scenario"
    exit 1
fi

# Start the Docker container for the selected scenario
docker run -d --name "$selected_scenario" "$selected_scenario"

# Provide instructions or information for participants
cat "$scenario_dir/instructions.txt"  # Assuming instructions.txt exists in the scenario directory

# You can add any other scenario-specific setup or instructions as needed