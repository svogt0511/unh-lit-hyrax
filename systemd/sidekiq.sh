#!/bin/bash
# Run as user: hyrax
cd
source ~/.bashrc
echo "--------------------------STARTING SIDEKIQ--------------------"
ruby --version
cd /var/www/hyrax
pwd
export MAGICK_TEMPORARY_PATH="/mnt/LocalDataStores/hyrax/tmp_magick"
export MAGICK_TMPDIR="/mnt/LocalDataStores/hyrax/tmp_magick"
export MAGICK_TEMPDIR="/mnt/LocalDataStores/hyrax/tmp_magick"
bundle exec sidekiq
echo "--------------------------ENDING SIDEKIQ--------------------"
echo ""


