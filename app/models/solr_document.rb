# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds Hyrax behaviors to the SolrDocument.
  include Hyrax::SolrDocumentBehavior


  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models.

  use_extension( Hydra::ContentNegotiation )

  # Documented code does not work:
  #   https://samvera.github.io/customize-metadata-show-page.html#create-a-custom-presenter-class
  #
  def contact_email
    self['contact_email_tesim']
  end

  def contact_phone
    self['contact_phone_tesim']
  end

  def spatial_coverage
    self['spatial_coverage_tesim']
  end

  def extent
    self['extent_tesim']
  end

  def bibliographic_citation
    self['bibliographic_citation_tesim']
  end

=begin
  def alt_title
    self['alt_title_tesim']
  end
=end
end
