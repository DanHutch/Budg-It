# README
## Budg-It

Budg-It is a rails-app designed to allow a user to access visual at-a-glance budget snapshots for particular categories within the "Immediate Obligations" (first) category group of their own budget, as tracked by the app, You Need a Budget. Budg-It consumes data from the You Need a Budget API and also authenticates users using YNAB-provided OmniAuth. It was developed using Ruby 2.4.1 and Rails 5.2.2.

### Setup:

To begin, clone this repo:

```
git@github.com:TimothyFell/Budg-It.git
```
After you `cd` into the project directory, run `bundle install` from the command line.
Next, run `bundle exec rake db:{drop,create,migrate}` to create the database and schema.

At this point, you should be able to run the local test suite using `bundle exec rspec`.

### Gems:

- rails
- pg
- puma
- sass-rails
- uglifier
- coffee-rails
- jbuilder
- bootsnap
- faraday
- figaro
- factory_bot_rails
- faker
- sendgrid-ruby
- omniauth
- omniauth-ynab
- twilio-ruby
- textris
- byebug
- rspec-rails
- database_cleaner
- simplecov
- shoulda-matchers
- capybara
- capybara-email
- launchy
- webmock
- vcr
- pry
- fuubar
- mailcatcher
- web-console
- listen
- tzinfo-data

### Schema:

![Schema Diagram](./schema_diagram.png)

### Requirements, Access, Security:

Budg-It uses `omniauth-ynab`, `sendgrid-ruby`, `twilio-ruby`, as well as the YNAB API, all of which have their own requirements for permission to use their software and data. You are responsible for knowing and implementing the requisite policies and code for their respective uses. We recommend using `figaro` to hide secret keys and other confidential information that is necessary in order to make use of these resources.

### Future Iterations:

- Real-time switching between tracked budget categories within the default budget and category-group.

-	Budget snapshots sent at user-selected times, via text and email.

### Contributing:

In order to contribute, please fork this repo, then clone your new repo and create a branch for your feature.

Please make sure to test your feature fully, using RSpec, before commiting your changes and pushing to your own repo, then create and submit a pull request back to this repository.

Please contact Dan Hutchinson, Silvestre Cuellar, or Timothy Fell on Github if you have any questions etc. Thank you!

* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions


