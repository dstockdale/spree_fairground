module SpreeFairground
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_fairground'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
