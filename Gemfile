source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.0.4"
gem "bootstrap-sass", "~> 3.3.6"
gem "puma", "~> 3.0"
gem "jquery-rails"
gem "devise"
gem "carrierwave",             "0.10.0"
gem "carrierwave-base64"
gem "mini_magick"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jquery-turbolinks"
gem "jbuilder", "~> 2.5"
gem "json"
gem "roo"
gem "roo-xls"
gem "font-awesome-sass"
gem "pry-rails"
gem 'momentjs-rails', '>= 2.9.0'
gem "paranoia", "~> 2.2"
gem "config"

group :production do
  gem 'rails_12factor'
  gem "pg"
end

group :development, :test do
  gem "byebug", platform: :mri
  gem "mysql2", ">= 0.3.18", "< 0.5"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
