require "sourcing"
require "dotenv"
require "pry"
require "csv"
Dotenv.load
Sourcing.api_key = ENV["SOURCING_KEY"]

class Source
  def initialize(email, output_csv)
    @email = email
    @output_csv = output_csv
  end

  # Checks if the person is what we're looking for and adds them to
  def run!
    add_to_csv if person && skilled?
  end

  def self.columns
    [:name, :email, :score, :github, :url,  ]
  end

  private

  # memoized person
  def person
    @person ||= Sourcing::Person[email: @email]
  end

  def add_to_csv
    @output_csv << self.class.columns.map { |col| person.send(col) }
  end

  def skilled?
    return true if person.all_languages.include?("Ruby")
    return true if person.all_languages.include?("CoffeeScript")
    return true if person.frameworks.include?("Rails")
    false
  end
end

CSV.open("data/leads.csv", "w") do |csv|
  emails = ["tom@joingrouper.com", "info@eribium.org"]
  csv << Source.columns
  emails.each { |email| Source.new(email, csv).run! }
end