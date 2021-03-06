require "data_spec/version"
require 'data_spec/helpers'
require 'data_spec/matchers'

if RSpec && RSpec.respond_to?(:configure)
  RSpec.configure do |config|
    config.include DataSpec::Matchers
    config.include DataSpec::Helpers
  end
end

if defined?(World)
  require 'data_spec/cucumber'
end
