#! /bin/bash
echo $PATH
export PATH=/usr/local/rvm/rubies/ruby-2.4.1/bin:$PATH
yum install git net-tools -y
cd /usr/share
git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
cd ..
git clone https://github.com/angelok139/angelok139 -b terraform
cd angelok139/AutoDeploy.scripts
cp pumad.service /etc/systemd/system/multi-user.target.wants/
cp auto_deploy.sh ../../reddit/deploy.sh

