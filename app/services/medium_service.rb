# services/medium_service.rb

module Hyrax
	class MediumService < QaSelectService
		def initialize(_authority_name = nil)
			super('medium')
		end
	end
end
