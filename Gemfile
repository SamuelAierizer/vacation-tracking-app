source "https://rubygems.org"

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"

gem "redis", ">= 4.0.1"
gem "sidekiq", "~> 6.5"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false


group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman"
  gem "bundler-audit"
  gem "rubocop"
  gem "rubocop-performance", "~> 1.5"
  gem "rubocop-rails", "~> 2.3"
  gem "rubocop-rspec", "~> 2.0"
  gem "rubocop-thread_safety"
  gem "rubocop-rails-omakase"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "view_component"
