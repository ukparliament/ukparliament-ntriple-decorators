require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   Coveralls::SimpleCov::Formatter,
                                                                   SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'parliament'
require 'parliament/ntriple'
require 'parliament/grom/decorator'

require 'webmock/rspec'
require 'vcr'
require 'timecop'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  Dir['./spec/parliament/grom/decorator/support/**/*.rb'].each { |f| require f }
end
