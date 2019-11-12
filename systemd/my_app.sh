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
echo "--------------------------STARTING MY_APP--------------------"
rvm use 2.6.3@my_app516
rvm gemset dir
rails s --binding=0.0.0.0
#
#rails s -b 'ssl://localhost:3000?key=path/to/file/localhost.key&cert=path/to/file/localhost.crt'
#rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/certs/localhost.key&cert=/usr/local/dev/ruby/my_app/certs/localhost.crt'
#rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'
#rails s -b 'ssl://132.177.138.60:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'
# rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'
# rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'

echo "--------------------------ENDING MY_APP--------------------"
echo ""
