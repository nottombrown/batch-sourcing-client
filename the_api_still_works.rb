require "csv"
require "parallel"
require "sourcing"
require "dotenv"
require "pry"

Dotenv.load
Sourcing.api_key = ENV["SOURCING_KEY"]


person = Sourcing::Person[email: "thejash@gmail.com"]
binding.pry

