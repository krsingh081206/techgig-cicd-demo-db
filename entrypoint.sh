#!/bin/bash

# Check if any command-line arguments are provided
if [ $# -eq 0 ]; then
  echo "No Liquibase command specified. Defaulting to 'update'."
  command="liquibase:update"
else
  # Join all command-line arguments into a single string separated by spaces
  command="liquibase:$@"
fi

# Run Maven with the specified Liquibase command
echo "Running Maven Liquibase command: $command"
mvn $command
