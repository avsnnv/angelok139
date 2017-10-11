#! /bin/bash

export PATH=/usr/local/rvm/rubies/ruby-2.4.1/bin:$PATH
cd /usr/share/reddit
puma -d
