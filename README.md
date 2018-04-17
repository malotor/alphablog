# Ruby On Rail Blog Example

## Install

      docker-compose build
      docker-compose up -d web
      docker-compose exec web rails db:migrate
      docker-compose exec web rails db:seed
      docker-compose exec web rails db:migrate RAILS_ENV=test

      docker-compose exec web rails test
      docker-compose exec web rspec spec/features/

## web

      http://localhost:3000

## Documentation Tips

    # Create new app
    rails new app_name

    # Create new rails app with postgres
    rails new . --force --database=postgresql

    # Create new rails app without test framework
    rails new . -T

    rails new . --force --database=postgresql

    # Init rspec
    rails generate rspec:install

    # Run the server
    rails server -b 0.0.0.0

    # Check routes
    rails routes


    # Update bundle
    gem install bundler

    # Install Gems without production gems
    bundle install --without production

    # Scaffold
    rails generate scaffold Article title:string description:text
    rails generate scaffold Article --skip --no-helper --no-assets --no-controller-specs --no-view-specs

    # Rails generate migration
    rails generate migration create_articles

## Bootstrap 4

    https://github.com/twbs/bootstrap-rubygem

## Heroku

    heroku --version

    heroku login

    heroku create

    heroky keys:add

    git push heroku master

    heroku rename alpha-blog

    heroku run rake db:migrate
    heroku run rails db:migrate
