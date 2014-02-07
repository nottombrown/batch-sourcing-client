require "./lib/source"
require "csv"
require "parallel"

CSV.open("data/leads.csv", "w") do |output_csv|
  output_csv << Source.columns

  emails = []
  CSV.foreach(ARGV[0]) { |row| emails << row.first }

  Parallel.each(emails, in_threads: 10) do |email|
    Source.new(email, output_csv).run!
  end
end