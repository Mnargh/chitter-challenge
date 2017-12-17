require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
# require 'database_cleaner'
require 'pry'
require './app/models/peep'
require './app/chitter'
require 'database_cleaner'
Capybara.app = Chitter



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

  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
