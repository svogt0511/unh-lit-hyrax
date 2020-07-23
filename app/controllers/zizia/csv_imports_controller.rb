require_dependency Zizia::Engine.config.root.join('app', 'controllers', 'zizia', 'csv_imports_controller.rb').to_s

# The 'be_upload' and other methods are borrowed from Bulkrax which uses the 'browseEverything' gem.

class Zizia::CsvImportsController

	def preview; end

	def be_upload
		respond_to do |format|
			# format.html { render html: "GREETINGS EARTHLINGS! (Chill!  Just having some fun!)" }
			format.json { render json: ( be_upload_doit params[ :cloud_files ] ) }
			# format.js   { render :layout => false }
		end
	end

	def be_upload_doit ( cloud_files )
		if ( !cloud_files.nil? )
			myFiles = JSON.parse (cloud_files)
			retrieve_cloud_files(myFiles)
			ret = { "result" => true }
		else
			ret = { "result" => false }
		end
	end

	# The tmp directory path for browse_everything/cloud file uploads.
	def path_for_import
		path = ENV['IMPORT_TMP_PATH'] || 'tmp/imports'
		FileUtils.mkdir_p(path) unless File.exist?(path)
		path
	end

  private

		def create_params
		    params.fetch(:csv_import, {}).permit(:manifest, :fedora_collection_id, :update_actor_stack, :selected_files)
		end

		def cloud_params
			params.permit(selected_files: {}).fetch(:selected_files).to_h if params&.[](:selected_files)
		end

		def files_for_import(cloud_files)
			return if cloud_files.blank?

			if cloud_files.present?
		  		# For BagIt, there will only be one bag, so we get the file_path back and set import_file_path
		  		# For CSV, we expect only file uploads, so we won't get the file_path back
		 		  # and we expect the import_file_path to be set already
		  		target = @importer.parser.retrieve_cloud_files(cloud_files)
		  		@importer[:parser_fields]['import_file_path'] = target unless target.blank?
			end
			@importer.save
		end

		def retrieve_cloud_files(files)
		  return if files.blank?

		  files_path = File.join(path_for_import, 'files')
		  FileUtils.mkdir_p(files_path) unless File.exist?(files_path)

		  files.each_pair do |_key, file|
				# fixes bug where auth headers do not get attached properly
				if file['auth_header'].present?
					file['headers'] ||= {}
					file['headers'].merge!(file['auth_header'])
				end
			  # this only works for uniquely named files
			  target_file = File.join(files_path, file['file_name'].tr(' ', '_'))
			  Zizia::DownloadCloudFileJob.perform_later(file, target_file)
		  end

		  return nil
		end

end
