module HyraxHelper
  include ::BlacklightHelper
  include Hyrax::BlacklightOverride
  include Hyrax::HyraxHelperBehavior

  # Change/override the join string. (from " // " to ' | ')
  def construct_page_title(*elements)
    (elements.flatten.compact).join(' | ')
  end
end
