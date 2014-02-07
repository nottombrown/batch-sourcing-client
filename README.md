Request Sourcing.io for scores for a set of emails, filter by rubyists

Place `SOURCING_KEY` from [the accounts page](https://sourcing.io/profile) in `.env`

Point it at a csv file of emails (each separated by a newline)

```bash
bundle
bundle exec ruby sourcing.rb data/example_emails.csv
```

test it with
```bash
bundle exec ruby test_sourcing.rb
```

This will create a csv of the candidates at `data/leads.csv`