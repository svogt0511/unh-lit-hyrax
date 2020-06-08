# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds Hyrax behaviors to the SolrDocument.
  include Hyrax::SolrDocumentBehavior

  include BlacklightOaiProvider::SolrDocument

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

=begin
  field_semantics.merge!(
    title: "title_display",
    creator: "author_display",
    date: "pub_date",
    subject: "subject_topic_facet",
    format: "format",
    language: "language_facet"
  )
=end

  field_semantics.merge!(
    title: "title_tesim",
    alt_title: "alt_title_tesim",
    creator: "creator_tesim",
    date: "date_created_tesim",
    subject: "subject_tesim",
    keyword: "keyword_sim",
    description: "description_tesim",
    publisher: "publisher_tesim",
    format: "medium_tesim",
    language: "language_tesim",
    #description: "member_of_collection_ids_ssim",
    #rights_statement: "rights_statement_tesim"
  )

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

  def medium
    self['medium_tesim']
  end

  def alt_title
    self['alt_title_tesim']
  end

  # blacklight_oai_provider
  #self.timestamp_key = 'record_creation_date' # Default: 'timestamp'

end
