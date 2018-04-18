# Ruby On Rail Blog Example

## docker


      # docker-compose run web rails new . --force --database=postgresql
      docker-composer exex  rails new . -T #Skip test framework
      docker-compose run web rails new . --force --database=postgresql
      docker-compose up -d web
      docker-compose exec web rails db:migrate
      docker-compose exec web rails db:migrate RAILS_ENV=test
      docker-compose exec web rails generate rspec:install

## Documentation

        # Create new app

        rails new app_name

        # Run the server

        rails server -b 0.0.0.0

        # Check routes

        rails routes


        # Update bundle

        gem install bundler

        # Install Gems

        bundle install --without production



        # Heroku

        heroku --version

        heroku login

        heroku create

        heroky keys:add

        git push heroku master

        heroku rename alpha-blog

        heroku run rake db:migrate
        heroku run rails db:migrate


        # Scaffold

        rails generate scaffold Article title:string description:text

        rails db:migrate


        # Rails generate migration

        rails generate migration create_articles

        rake db:migrate
        rails db:migrate
        rails db:rollback



        # Articles
        rails console

        > reload
        article.errors.any?

        article.errors.full_messages


        # Bootstrap

        https://github.com/twbs/bootstrap-rubygem


        # Debug

        debugger

        # Rails console
        user.admin?

        # Test

        rails test
