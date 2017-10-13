#! /bin/bash
echo $PATH
export PATH=/usr/local/rvm/rubies/ruby-2.4.1/bin:$PATH
echo "source /etc/bash.bashrc" >> /etc/bashrc
yum install git net-tools -y
cd /usr/share
git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
cd ..
chmod 777 -R reddit
echo "username ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

