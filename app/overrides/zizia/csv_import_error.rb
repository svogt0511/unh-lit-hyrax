class Zizia::CSVImportError < StandardError

  def initialize(msg="CSV import error.  Check your import settings and csv file for errors.", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end

end