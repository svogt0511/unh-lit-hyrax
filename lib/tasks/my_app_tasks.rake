namespace :my_app_tasks do
  desc "TODO - Start of dump_fcrepo_files.  Run in app root.  Assumes existence of APP_ROOT/tmp/files."
  task dump_fcrepo_files: :environment do

    # Get the describing metadata. Assuming run from app root.
    system ("curl -H 'Accept: text/turtle' 'http://digitalcollections.unh.edu:8984/rest/brown/ny-8612_10-1/4d/9f/b9/72/4d9fb972-b09a-4240-a691-a82c55eac63a/fcr:metadata'")

    # Dump the file.  Assuming run from app root.
    system ("curl  http://digitalcollections.unh.edu:8984/rest/brown/ny-8612_10-1/4d/9f/b9/72/4d9fb972-b09a-4240-a691-a82c55eac63a > tmp/files/ny-8612_10-1.jpg")

  end

end
