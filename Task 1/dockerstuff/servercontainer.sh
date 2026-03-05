#!/bin/bash

docker run --rm -it \
-p 8443:8443 \
-v "$PWD":/app \
-w /app \
python:3 \
python https_server.py