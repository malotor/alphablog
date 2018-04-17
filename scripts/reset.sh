#!/bin/sh
docker-compose down
rm db/*.sqlite3
docker-compose up -d web
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed
