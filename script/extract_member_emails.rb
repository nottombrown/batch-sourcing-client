# Extract emails from our main database.
#
# This should be run from within the context of primary GrouperApp repo in
# order to access models

# This was last run on Jan 23rd
max_date = Time.new(2014, 1, 23) - 2.years

CSV.open("emails.csv", "w") do |csv|

  Member.joins(:crews).
    where("crews.created_at > ?", 12.months.ago). # Went recently
    where("members.created_at > ?", max_date). # Skip people we've looked at
    # where("city_id = ?", 1). # In nyc
    uniq.
    find_each do |m|
      # Write the email to our csv
      csv << [m.email]
    end
end