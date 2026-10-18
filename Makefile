setup:
	bundle install
	bin/rails tailwindcss:build
	bin/rails db:prepare
	bin/rails db:seed

start:
	bin/rails server -b 0.0.0.0 -p 3000

lint:
	bundle exec rubocop
	bundle exec herb-lint app/views

test:
	bin/rails test

.PHONY: setup start lint test
