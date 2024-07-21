# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in administrate-mistybird.gemspec
gemspec

gem "rake", "~> 13.0"

gem 'refile', require: 'refile/rails', github: 'vitalinfo/refile'
gem 'refile-mini_magick'

gem "sprockets-rails"
gem "administrate", github: "goosys/administrate", branch: "feature/contextualize"

group :development, :test do
  gem "rspec", "~> 3.0"
  gem 'rspec-rails'
  gem 'sqlite3', "~> 1.4"
end
