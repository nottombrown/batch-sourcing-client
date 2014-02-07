Turns a set of emails into a set of github accounts. Filters by ruby/rails experts.

Place `SOURCING_KEY` from [the accounts page](https://sourcing.io/profile) in `.env`

Point it at a csv file of emails (each separated by a newline)

Tested with ruby 2.1.0

```bash
bundle
bundle exec ruby sourcing.rb data/example_emails.csv
```

test it with
```bash
bundle exec ruby test_sourcing.rb
```

This will create a csv of the candidates at `data/leads.csv`