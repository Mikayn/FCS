#!/bin/bash

docker run --rm -it \
-p 8443:8443 \              # port  
-v "$PWD":/app \            # mount the current director to /app in the container
-w /app \                   # go to /app
python:3 \
python https_server.py      # run the script