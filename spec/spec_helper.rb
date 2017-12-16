require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
# require 'database_cleaner'
require 'pry'
require './app/models/peep'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered changing what rubocop says? Rubocop is an evil creation!\e[0m"
  end
end
