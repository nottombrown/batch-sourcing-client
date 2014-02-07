require "./lib/source"

output_csv = [] # An ary can act as a csv
emails = ["nottombrown@gmail.com", "info@eribium.org"].each do |email|
  Source.new(email, output_csv).run!
end
p output_csv
