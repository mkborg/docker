#!/bin/bash -x

TAG="vmcontrol"

docker build -t ${TAG} - < Dockerfile