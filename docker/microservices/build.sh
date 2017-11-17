#! /bin/bash

docker build -t angelok139/post:1.0 ./post-py
docker build -t angelok139/comment:1.0 ./comment
docker build -t angelok139/ui:2.0 ./ui

