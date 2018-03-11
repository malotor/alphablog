# Ruby On Rail Blog Example

## docker

      docker-compose exec rails db:migrate

      # docker-compose run web rails new . --force --database=postgresql


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

        user.toogle(:admin)
        user.admin?
