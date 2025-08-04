#!/bin/bash
# This script builds the Docker image for the correct platform.
docker build --platform linux/arm64 -t smadi0x86-site .