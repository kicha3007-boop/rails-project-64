setup:
	bundle install
	bin/rails tailwindcss:build
	bin/rails db:prepare
	bin/rails db:seed

start:
	bin/rails server -b 0.0.0.0 -p 3000

lint:
	bundle exec rubocop
	npx -y @herb-tools/linter app/views

test:
	bin/rails test

.PHONY: setup start lint test
