.PHONY: build migrate bundle yarncreate up up-d down open bash console db logs rspec rubocop rubocop-a help
.DEFAULT_GOAL := help

setup:
	make build
	make bundle
	make dbcreate
	make migrate
	make up

build:
	docker-compose -f docker-compose.development.yml build --build-arg GITHUB_ACCESS_TOKEN=${GITHUB_ACCESS_TOKEN}

dbcreate:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec rails db:create

migrate:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec ridgepole -c config/database.yml -E development --apply -f db/schemas/Schemafile
	docker-compose -f docker-compose.development.yml run --rm api bundle exec ridgepole -c config/database.yml -E test --apply -f db/schemas/Schemafile

bundle:
	docker-compose -f docker-compose.development.yml run --rm api bundle install

yarncreate:
	docker-compose -f docker-compose.development.yml run --rm front yarn create next-app .

up:
	docker-compose -f docker-compose.development.yml up

up-d:
	docker-compose -f docker-compose.development.yml up -d

down:
	docker-compose -f docker-compose.development.yml down

restart:
	docker-compose -f docker-compose.development.yml restart

open:
	open http://localhost:3000

bash:
	docker-compose -f docker-compose.development.yml run --rm api bash

console:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec rails console

db:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec rails db -p

logs:
	docker-compose -f docker-compose.development.yml logs

rspec:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec rspec

rubocop:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec rubocop

rubocop-a:
	docker-compose -f docker-compose.development.yml run --rm api bundle exec rubocop -a

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
