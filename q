[1mdiff --git a/config/browse_everything_providers.yml b/config/browse_everything_providers.yml[m
[1mindex 83b3d3a..1f9c004 100644[m
[1m--- a/config/browse_everything_providers.yml[m
[1m+++ b/config/browse_everything_providers.yml[m
[36m@@ -3,7 +3,7 @@[m
 # The file_system provider can be a path to any directory on the server where your application is running.[m
 #[m
 file_system:[m
[31m-  home: /usr/local/dev/ruby/my_app516[m
[32m+[m[32m  home: /var/www/hyrax[m
 # dropbox:[m
 #   client_id: YOUR_DROPBOX_APP_KEY[m
 #   client_secret: YOUR_DROPBOX_APP_SECRET[m
[1mdiff --git a/config/cable.yml b/config/cable.yml[m
[1mindex 91c377c..6a6f581 100644[m
[1m--- a/config/cable.yml[m
[1m+++ b/config/cable.yml[m
[36m@@ -9,4 +9,4 @@[m [mtest:[m
 production:[m
   adapter: redis[m
   url: redis://localhost:6379/1[m
[31m-  channel_prefix: my_app_production[m
[32m+[m[32m  channel_prefix: hyrax_production[m
[1mdiff --git a/config/environments/development.rb b/config/environments/development.rb[m
[1mindex e743611..2853724 100644[m
[1m--- a/config/environments/development.rb[m
[1m+++ b/config/environments/development.rb[m
[36m@@ -47,9 +47,18 @@[m [mRails.application.configure do[m
   # number of complex assets.[m
   config.assets.debug = true[m
 [m
[32m+[m[32m  config.assets.digest = false[m
[32m+[m
   # Suppress logger output for asset requests.[m
   config.assets.quiet = true[m
 [m
[32m+[m
[32m+[m[32m#config.assets.configure do |env|[m
[32m+[m[32m#  env.cache = ActiveSupport::Cache.lookup_store(:null_store)[m
[32m+[m[32m#end[m
[32m+[m
[32m+[m[32m  # config.assets.prefix = "/dev-assets"[m
[32m+[m
   # Raises error for missing translations[m
   # config.action_view.raise_on_missing_translations = true[m
 [m
[36m@@ -76,4 +85,5 @@[m [mRails.application.configure do[m
   config.action_mailer.default_url_options = { host: ENV.fetch("APPLICATION_HOST", "digitalcollections-test.unh.edu"), protocol: ENV.fetch("APPLICATION_HOST_PROTOCOL", "https") }[m
   config.action_mailer.delivery_method = :smtp[m
   config.action_mailer.perform_deliveries = true[m
[32m+[m
 end[m
[1mdiff --git a/config/environments/production.rb b/config/environments/production.rb[m
[1mindex 9d6d894..a5816bc 100644[m
[1m--- a/config/environments/production.rb[m
[1m+++ b/config/environments/production.rb[m
[36m@@ -59,7 +59,7 @@[m [mRails.application.configure do[m
 [m
   # Use a real queuing backend for Active Job (and separate queues per environment)[m
   # config.active_job.queue_adapter     = :resque[m
[31m-  # config.active_job.queue_name_prefix = "my_app_#{Rails.env}"[m
[32m+[m[32m  # config.active_job.queue_name_prefix = "hyrax_#{Rails.env}"[m
   config.action_mailer.perform_caching = false[m
 [m
   # Ignore bad email addresses and do not raise email delivery errors.[m
[1mdiff --git a/config/initializers/hyrax.rb b/config/initializers/hyrax.rb[m
[1mindex 55ec9bb..d398e8b 100644[m
[1m--- a/config/initializers/hyrax.rb[m
[1m+++ b/config/initializers/hyrax.rb[m
[36m@@ -47,9 +47,17 @@[m [mHyrax.config do |config|[m
   # config.uploader = {[m
   #   limitConcurrentUploads: 6,[m
   #   maxNumberOfFiles: 100,[m
[31m-  #   maxFileSize: 500.megabytes[m
[32m+[m[32m  #   maxFileSize: 500.gigabytes[m
   # }[m
 [m
[32m+[m[32m  # Options to control the file uploader.  We are allowing 10GB but practically speaking[m
[32m+[m[32m  # 1 GB or less is the most practical.[m
[32m+[m[32m  config.uploader = {[m
[32m+[m[32m    limitConcurrentUploads: 6,[m
[32m+[m[32m    maxNumberOfFiles: 100,[m
[32m+[m[32m    maxFileSize: 10.gigabytes[m
[32m+[m[32m  }[m
[32m+[m
   # Enable displaying usage statistics in the UI[m
   # Defaults to false[m
   # Requires a Google Analytics id and OAuth2 keyfile.  See README for more info[m
[36m@@ -60,7 +68,8 @@[m [mHyrax.config do |config|[m
 [m
   # Date you wish to start collecting Google Analytic statistics for[m
   # Leaving it blank will set the start date to when ever the file was uploaded by[m
[31m-  # NOTE: if you have always sent analytics to GA for downloads and page views leave this commented out[m
[32m+[m[32m  # NOTE: if you have always sent analytics to GA for downloads and page views[m
[32m+[m[32m  # leave this commented out[m
   # config.analytic_start_date = DateTime.new(2014, 9, 10)[m
 [m
   # Enables a link to the citations page for a work[m
[36m@@ -193,6 +202,7 @@[m [mHyrax.config do |config|[m
   # Location on local file system where derivatives will be stored[m
   # If you use a multi-server architecture, this MUST be a shared volume[m
   # config.derivatives_path = Rails.root.join('tmp', 'derivatives')[m
[32m+[m[32m  config.derivatives_path = '/mnt/LocalDataStores/hyrax/tmp/derivatives'[m
 [m
   # Should schema.org microdata be displayed?[m
   # config.display_microdata = true[m
[36m@@ -205,6 +215,7 @@[m [mHyrax.config do |config|[m
   # prior to being ingested into the repository or having derivatives generated.[m
   # If you use a multi-server architecture, this MUST be a shared volume.[m
   # config.working_path = Rails.root.join( 'tmp', 'uploads')[m
[32m+[m[32m  config.working_path = '/mnt/LocalDataStores/hyrax/tmp/uploads'[m
 [m
   # Should the media display partial render a download link?[m
   # config.display_media_download_link = true[m
[1mdiff --git a/lib/tasks/my_app_tasks.rake b/lib/tasks/my_app_tasks.rake[m
[1mindex 14bac01..2caf2f4 100644[m
[1m--- a/lib/tasks/my_app_tasks.rake[m
[1m+++ b/lib/tasks/my_app_tasks.rake[m
[36m@@ -1,4 +1,4 @@[m
[31m-namespace :my_app_tasks do[m
[32m+[m[32mnamespace :hyrax_tasks do[m
   desc "TODO - Start of dump_fcrepo_files.  Run in app root.  Assumes existence of APP_ROOT/tmp/files."[m
   task dump_fcrepo_files: :environment do[m
 [m
[1mdiff --git a/systemd/my_app.sh b/systemd/my_app.sh[m
[1mdeleted file mode 100755[m
[1mindex d07098d..0000000[m
[1m--- a/systemd/my_app.sh[m
[1m+++ /dev/null[m
[36m@@ -1,25 +0,0 @@[m
[31m-#!/bin/bash[m
[31m-echo "This is a sample script to test auto run during boot"[m
[31m-echo "The time the script run was -->  `date`"[m
[31m-source ~/.bashrc[m
[31m-ruby --version[m
[31m-which rvm[m
[31m-rvm gemset list[m
[31m-rvm gemset use my_app516[m
[31m-rvm gemset list[m
[31m-cd /usr/local/dev/ruby/my_app516[m
[31m-pwd[m
[31m-echo "--------------------------STARTING MY_APP--------------------"[m
[31m-rvm use 2.6.3@my_app516[m
[31m-rvm gemset dir[m
[31m-rails s --binding=0.0.0.0[m
[31m-#[m
[31m-#rails s -b 'ssl://localhost:3000?key=path/to/file/localhost.key&cert=path/to/file/localhost.crt'[m
[31m-#rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/certs/localhost.key&cert=/usr/local/dev/ruby/my_app/certs/localhost.crt'[m
[31m-#rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'[m
[31m-#rails s -b 'ssl://132.177.138.60:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'[m
[31m-# rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'[m
[31m-# rails s -b 'ssl://0.0.0.0:3000?key=/usr/local/dev/ruby/my_app/cert/localhost.key&cert=/usr/local/dev/ruby/my_app/cert/localhost.crt'[m
[31m-[m
[31m-echo "--------------------------ENDING MY_APP--------------------"[m
[31m-echo ""[m
