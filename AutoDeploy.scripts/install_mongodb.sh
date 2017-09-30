#! /bin/sh

yum install mongodb-server -y
systemctl enable mongod
systemctl start mongod

