#! /bin/bash
sudo docker-machine create --driver google --google-project docker-186308 --google-machine-type g1-small --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20171107b docker-host
eval $(sudo docker-machine env docker-host)

