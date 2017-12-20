# Ruby On Rail Blog Example

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


        # Scaffold

        rails generate scaffold Article title:string description:text

        rake db:migrate


        # Rails generate migration

        rails generate migration create_articles

        rake db:migrate
        rails db:migrate
        rails db:rollback


        # Articles
        rails console
        
        > reload
