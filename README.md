# README

##### Prerequisites

The setups steps expect the following tools to be installed on the system.

- Ruby 3.3.0
- Rails 7.1.2
- Bundler 2.5.4

##### 1. Check out the repository

```bash
git clone git@github.com:mirandashort/recipe-roulette-rails.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```bash
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Install dependencies

```bash
bundle install
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
bundle exec rails s
```