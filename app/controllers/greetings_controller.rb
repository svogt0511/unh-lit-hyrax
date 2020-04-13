class GreetingsController < ApplicationController

  def hello
   respond_to do |format|
      # format.html { render html: greetings_earthling_1}
      format.json { render json: greetings_earthling }
      # format.js   { render :layout => false }
   end
  end

  def greetings_earthling

	if Dir.exist?(ENV['IMPORT_PATH'])
        files = Dir.entries(ENV['IMPORT_PATH']).select {|entry| File.directory? File.join(ENV['IMPORT_PATH'], entry) and !(entry == '.' || entry == '..') }
        list = files
    else
       list = []
    end
  end

  def hello_csv
   respond_to do |format|
      format.html { render html: "GREETINGS EARTHLINGS!"}
      format.json { render json: greetings_earthling_csv }
      # format.js   { render :layout => false }
   end
  end

  def greetings_earthling_csv
    file_name = params[:file_root] + ".csv"
    file_path = ENV['IMPORT_PATH'] + '/' + params[:file_root] + '/' + file_name
    if ( File.exist?(file_path) )
    	ret = { "file" => file_name }
    else
        ret = { "file" => file_path + " not found" }
        # ret = { "file" => "NOT FOUND" }
    end
  end

end
