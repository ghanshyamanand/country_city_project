source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# new gems added for deployment ....
group :production do
  gem 'unicorn'
  gem 'unicorn-worker-killer'
  gem 'pg', '~> 0.18.4'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'faker' # http://rubydoc.info/github/stympy/faker/master/frames
  gem 'foreman'
  gem 'mailcatcher'
  gem 'pry-rails'
  gem 'pry-byebug'
end



## GO-RAILS part
# gem 'capistrano', '~> 3.1.0'

# group :development do
#   gem "capistrano", "~> 3.6"
# end

# gem 'capistrano-bundler', '~> 1.1.2'
# gem 'capistrano-rails', '~> 1.1.1'

# # # Add this if you're using rbenv
# # # gem 'capistrano-rbenv', github: "capistrano/rbenv"

# # # Add this if you're using rvm
# gem 'capistrano-rvm', github: "capistrano/rvm"

## Peeyush Singla part from github
# group :development do
#   gem 'capistrano-rails'
#   gem 'capistrano-rvm'
#   gem 'capistrano3-unicorn'
# end


## interakt part

# gem 'rvm-capistrano'
# gem 'capistrano', group: :development, require: false
# group :development, :test do
#   gem 'capistrano-sidekiq'
# end


gem 'capistrano', '~> 3.0', require: false, group: :development

group :development do
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
end

group :development do
  gem 'capistrano-rvm',   '~> 0.1', require: false
end
