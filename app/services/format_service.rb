# services/format_service.rb

module Hyrax
	class FormatService < QaSelectService
		def initialize(_authority_name = nil)
			super('format')
		end
	end
end
