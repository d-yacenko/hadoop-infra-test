#!/bin/sh

sudo systemctl start docker
sudo chmod o+w /var/run/docker.sock
docker build -t dyacenko/hadoop-infra-test .
docker login
docker push dyacenko/hadoop-infra-test
