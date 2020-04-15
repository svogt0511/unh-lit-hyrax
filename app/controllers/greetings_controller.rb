class GreetingsController < ApplicationController

  def hello
   respond_to do |format|
      # format.html { render html: greetings_earthling_1}
      format.json { render json: ( greetings_earthling params[:import_path_root] ) }
      # format.js   { render :layout => false }
   end
  end

  def greetings_earthling (import_path_root)
	if Dir.exist?(import_path_root)
        files = Dir.entries(import_path_root).select {|entry| File.directory? File.join(import_path_root, entry) and !(entry == '.' || entry == '..') }
        list = files
    else
       list = []
    end
  end

  def hello_csv
   respond_to do |format|
      format.html { render html: "GREETINGS EARTHLINGS! (Chill!  Just having some fun!)"}
      format.json { render json: ( greetings_earthling_csv params[:import_path_root], params[:collection_name], params[:file_name]) }
      # format.js   { render :layout => false }
   end
  end

  def greetings_earthling_csv ( import_path_root, collection_name, file_name )
    file_path = File.join(import_path_root, collection_name, file_name)
    if ( File.exist?(file_path) )
    	# ret = { "file" => file_name }
    	ret = { "file" => "" }
    else
        ret = { "file" => "" }
        # ret = { "file" => "NOT FOUND" }
    end
  end

end
