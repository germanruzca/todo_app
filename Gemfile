source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'graphql'
gem 'jwt'
gem "interactor", "~> 3.0"
gem 'dotenv-rails'
gem 'rack-cors'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.1'
  gem 'faker'
end

group :development do
  gem 'graphiql-rails'
end

