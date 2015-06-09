source 'https://rubygems.org'

gem 'spree', github: 'spree/spree', branch: '3-0-stable'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '3-0-stable'
# my version of the locales ext
gem 'spree_i18n', github: 'dstockdale/spree_i18n', branch: '3-0-stable'

gemspec

group :test do
  if RUBY_PLATFORM.downcase.include? "darwin"
    gem 'guard-rspec'
    gem 'rb-fsevent'
    gem 'terminal-notifier-guard'
  end
  gem 'pry'
end
