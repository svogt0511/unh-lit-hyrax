require_dependency Bulkrax::Engine.config.root.join('app', 'controllers', 'bulkrax', 'importers_controller.rb').to_s

# frozen_string_literal: true

class Bulkrax::ImportersController

    # PATCH/PUT /importers/1
    def update
      # rubocop:disable Style/IfInsideElse
      if api_request?
        return return_json_response unless valid_update_params?
      end

      file = file_param
      cloud_files = cloud_params

      # Skipped during a continue
      field_mapping_params if params[:importer][:parser_fields].present?

      if @importer.update(importer_params)
        files_for_import(file, cloud_files) unless file.nil? && cloud_files.nil?
        # do not perform the import
        if params[:commit] == 'Update Importer'
        # do nothing
        # OAI-only - selective re-harvest
        elsif params[:commit] == 'Update and Harvest Updated Items'
          Bulkrax::ImporterJob.perform_later(@importer.id, true)
        # Perform a full metadata and files re-import; do the same for an OAI re-harvest of all items
        # Change encoding of the if statement otherwise we never execute this code for 'Update and Re-Harvest All Items' (Bulkrax Issue #203)
        #elsif params[:commit] == ('Update and Re-Import (update metadata and replace files)' || 'Update and Re-Harvest All Items')
        elsif ((params[:commit] == 'Update and Re-Import (update metadata and replace files)') || (params[:commit] ==  'Update and Re-Harvest All Items'))
          @importer.parser_fields['replace_files'] = true
          @importer.save
          Bulkrax::ImporterJob.perform_later(@importer.id)
        # In all other cases, perform a metadata-only re-import
        else
          Bulkrax::ImporterJob.perform_later(@importer.id)
        end
        if api_request?
          json_response('updated', :ok, 'Importer was successfully updated.')
        else
          redirect_to importers_path, notice: 'Importer was successfully updated.'
        end
      else
        if api_request?
          json_response('update', :unprocessable_entity, 'Something went wrong.')
        else
          render :edit
        end
      end
      # rubocop:enable Style/IfInsideElse
    end
    # rubocop:enable Metrics/MethodLength

end
