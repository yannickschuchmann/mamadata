module XlsHelper
  # Return a string with a max length of 31 characters.
  # Adds '...' suffix in case of trimming.
  def trim_worksheet_name name
    name.gsub(/([\w\s]{28}).+/,'\1...')
  end
end