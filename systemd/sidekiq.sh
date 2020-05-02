#!/bin/bash
# Run as user: hyrax
cd
source ~/.bashrc
echo "--------------------------STARTING SIDEKIQ--------------------"
ruby --version
cd /var/www/hyrax
pwd
bundle exec sidekiq
echo "--------------------------ENDING SIDEKIQ--------------------"
echo ""


