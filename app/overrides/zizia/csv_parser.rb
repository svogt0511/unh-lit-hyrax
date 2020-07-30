require_dependency Zizia::Engine.config.root.join('lib', 'zizia', 'parsers', 'csv_parser.rb').to_s

require 'csv'

class Zizia::CsvParser

	##
	# Gives a record for each line in the .csv
	#
	# @see Parser#records
	def records
		return enum_for(:records) unless block_given?

		file.rewind

    # Remove BOM chars (excel), skip blank lines, skip lines with all blank fields.headers: true).each do |row|
		CSV.parse(file.read.sub("\xEF\xBB\xBF", ''), headers: true, skip_blanks: true, skip_lines: /^(?:\s*,\s*)+$/).each do |row|
			yield ::Zizia::InputRecord.from(metadata: row)
		end
	rescue CSV::MalformedCSVError => e
		Rails.logger.error "[zizia] The file #{file} could not be parsed as CSV: #{e}"
	end
end
