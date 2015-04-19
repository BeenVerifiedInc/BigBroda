$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'debugger' if Gem.ruby_version < Gem::Version.new('2.0')
require File.join(File.dirname(__FILE__), '../lib', 'bigbroda')
require 'stringio'
require "pry"
require "certified"

require 'vcr'


RSpec.configure do |config|

  config.treat_symbols_as_metadata_keys_with_true_values = true

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.hook_into :webmock
    c.allow_http_connections_when_no_cassette = true
    c.configure_rspec_metadata!
  end


  def fixture_key(type, filename)
    dir_name = type.to_s + "s"
    File.dirname(__FILE__) + "/fixtures/#{dir_name}/#{filename}"
  end

  def config_options
    config = YAML.load( File.open(fixture_key("config", "account_config.yml")) )
    config["key_file"]  = fixture_key("key", config["pem"])
    return config
  end

  def config_setup
    BigBroda::Config.setup do |config|
      config.pass_phrase = config_options["pass_phrase"]
      config.key_file    = config_options["key_file"]
      config.scope       = config_options["scope"]
      config.email       =  config_options["email"]
      config.retries     = config_options["retries"]
    end
    @project = config_options["options"]
  end

end
