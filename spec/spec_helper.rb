require 'bundler'
Bundler.setup

SPEC_ROOT = File.dirname(__FILE__)

require 'pry'

RSpec.configure do |config|
    config.mock_with :rspec
end

Dir[File.join(SPEC_ROOT, '/../lib/**/*.rb')].each{ |file| require file }
Dir[File.join(SPEC_ROOT, 'support', '**/*.rb')].each{ |file| require file }
