module SpreeAdminDark
  class Engine < Rails::Engine
    require 'spree/core'
    require 'sass-rails'
    isolate_namespace Spree
    engine_name 'spree_admin_dark'


    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
    
    initializer 'add_asset_and_import_paths_for_dark_theme' do
      ::Sass::Engine::DEFAULT_OPTIONS[:load_paths].tap do |load_paths|
        load_paths << File.expand_path('../../app/assets/stylesheets', __FILE__)
      end
      Rails.application.config.assets.paths << File.expand_path('../../app/assets/fonts', __FILE__)
    end
  end
end
