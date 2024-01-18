# README

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 3.3.0
- Rails 7.1.2

##### 1. Check out the repository

```zsh
git clone git@github.com:mirandashort/recipe-roulette-rails.git
```
##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```zsh
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```