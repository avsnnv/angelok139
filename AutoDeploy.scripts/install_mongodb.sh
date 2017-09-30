#! /bin/sh

yum install mongodb-server git -y
systemctl enable mongod
systemctl start mongod

