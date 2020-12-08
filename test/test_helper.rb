ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require_relative 'helpers/auth_helpers'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include AuthHelpers
end
