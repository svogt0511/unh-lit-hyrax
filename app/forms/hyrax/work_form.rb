# Generated via
#  `rails generate hyrax:work Work`
module Hyrax
  # Generated form for Work
  class WorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::Work
    self.terms += [:resource_type, :spatial_coverage, :extent, :bibliographic_citation,]

      # @param [Symbol] key the field to read
      # @return the value of the form field.
      # For display in edit page
      def [](key)
        return model.member_of_collection_ids if key == :member_of_collection_ids

        if key == :title
          # @attributes["title"].each do |value|
            # @attributes["alt_title"] << value
          # end
          # @attributes["alt_title"].delete(@attributes["alt_title"].sort.first) unless @attributes["alt_title"].empty?
          #return @attributes[key.to_s].sort.first
          return @attributes[key.to_s].first
        end

        super
      end

      # Cast back to multi-value when saving
      # Reads from form
      def self.model_attributes(attributes)
        attrs = super
        return attrs unless attributes[:title]

        attrs[:title] = Array(attributes[:title])
        return attrs if attributes[:alt_title].nil?
        #Array(attributes[:alt_title]).each do |value|
        #  attrs["title"] << value if value != ""
        #end
        attrs
      end
  end
end
