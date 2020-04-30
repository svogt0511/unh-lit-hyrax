#!/bin/bash
# Run as user: hyrax
cd
source ~/.bashrc
echo "--------------------------STARTING HYRAX--------------------"
ruby --version
cd /var/www/hyrax
pwd
rails s --binding=0.0.0.0
echo "--------------------------ENDING HYRAX--------------------"
echo ""
