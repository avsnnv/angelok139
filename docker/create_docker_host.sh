#! /bin/zsh
docker-machine create --driver google --google-project docker-186308 --google-machine-type n1-standard-1 --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts vm1
eval $(docker-machine env vm1)

