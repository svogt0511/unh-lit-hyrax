#!/bin/bash
echo "This is a sample script to test auto run during boot"
echo "The time the script run was -->  `date`"
source ~/.bashrc
ruby --version
which rvm
rvm gemset list
rvm gemset use my_app
rvm gemset list
cd /usr/local/dev/ruby/my_app
pwd
echo "--------------------------STARTING FCREPO--------------------"
#which solr_wrapper
rvm use 2.6.3@my_app516
rvm gemset dir
which fcrepo_wrapper
#`which fcrepo_wrapper`

echo "--------------------------ENDING FCREPO--------------------"
echo ""
