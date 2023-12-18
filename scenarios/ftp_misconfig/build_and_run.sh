#!/bin/bash

# Build the Docker image
docker build -t my-ftp-server .

# Run the Docker container
docker run -d --name my-ftp-container -p 21:21 -p 30000-30009:30000-30009 my-ftp-server