require "active_support/core_ext/module/attribute_accessors"

module BigBroda
  class Config

    def self.setup
      yield self
    end

    mattr_accessor  :pass_phrase,
                    :key_file,
                    :scope,
                    :email,
                    :retries,
                    :adapter_version

    def self.settings
      {
        :pass_phrase => pass_phrase,
        :key_file => key_file,
        :scope => scope,
        :email => email,
        :retries => retries,
        :adapter_version => adapter_version
      }
    end
    
  end
end
