source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'email_validator', '~> 2.2', '>= 2.2.3'
gem 'jsonapi-serializer', '~> 2.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'sqlite3', '~> 1.4'
end

group :development do
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
