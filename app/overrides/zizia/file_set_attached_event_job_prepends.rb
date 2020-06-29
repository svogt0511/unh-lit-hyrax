require_dependency Zizia::Engine.config.root.join('config', 'initializers', 'file_set_attached_event_job_prepends.rb').to_s

module FileSetAttachedEventJobPrepends
  def action
    if repo_object.kind_of?(FileSet)

      # Override - returns if no files in file_set.  Prevents NoMethodError('size') on 'pre_ingest_file = ...' below.
      if repo_object.files.first.nil?
        return
      end

      pre_ingest_work_id = Zizia::PreIngestWork.find_by(deduplication_key: curation_concern.deduplication_key)
      pre_ingest_file = Zizia::PreIngestFile.find_by(size: repo_object.files.first.size,
                                                     filename: repo_object.files.first.original_name,
                                                     pre_ingest_work_id: pre_ingest_work_id)

      # Override - returns if no files in file_set.  Prevents NoMethodError('status=') on 'pre_ingest_file.status = ...' below.                       
      if curation_concern.deduplication_key.nil?
        return
      end

      pre_ingest_file.status = 'attached'
      pre_ingest_file.save
    end
  end
end



