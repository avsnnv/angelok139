#! /bin/bash
echo $PATH
export PATH=/usr/local/rvm/rubies/ruby-2.4.1/bin:$PATH

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
