require_dependency Zizia::Engine.config.root.join('app', 'controllers', 'zizia', 'csv_imports_controller.rb').to_s

class Zizia::CsvImportsController

    def preview
		cloud_files_upload
		cloud_files = cloud_params
		Rails.logger.debug cloud_files.inspect
		retrieve_cloud_files(cloud_files)
		cloud_files_upload

    end

    private

    	def cloud_files_upload
			Rails.logger.debug "SKV2000 GGGGG - preview - uploading cloud files"
      	end

		def create_params
		    params.fetch(:csv_import, {}).permit(:manifest, :fedora_collection_id, :update_actor_stack, :selected_files)
		end

=begin
		def file_param
		params.require(:importer).require(:parser_fields).fetch(:file) if params&.[](:importer)&.[](:parser_fields)&.[](:file)
		end
=end

		#  this is used doe cloud files
		def path_for_import
		  #path = File.join(Bulkrax.import_path, importerexporter.id.to_s)
		  path = 'tmp/imports'
		  FileUtils.mkdir_p(path) unless File.exist?(path)
		  path
		end

		def cloud_params
			params.permit(selected_files: {}).fetch(:selected_files).to_h if params&.[](:selected_files)
		end

		#def files_for_import(file, cloud_files)
		def files_for_import(cloud_files)
			#return if file.blank? && cloud_files.blank?
			return if cloud_files.blank?
			#@importer[:parser_fields]['import_file_path'] = @importer.parser.write_import_file(file) if file.present?
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
			Rails.logger.debug "SKV2000 GGGGG - preview - retrieve cloud files"
			Rails.logger.debug target_file.inspect
			# Now because we want the files in place before the importer runs
			# Problematic for a large upload
			# Bulkrax::DownloadCloudFileJob.perform_now(file, target_file)
			# Zizia::DownloadCloudFileJob.perform_now(file, target_file)
			Zizia::DownloadCloudFileJob.perform_later(file, target_file)
		  end
		  return nil
		end


end