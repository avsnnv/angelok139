#! /bin/bash

sudo cp /tmp/pumad.service /etc/systemd/system/pumad.service
sudo systemctl enable pumad
sudo systemctl start pumad

