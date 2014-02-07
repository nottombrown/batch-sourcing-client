require "./lib/source"

output_csv = []
emails = ["tom@joingrouper.com", "info@eribium.org"].each do |email|
  Source.new(email, output_csv).run!
end
p output_csv
