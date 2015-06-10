module SpreeOwl
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_owl\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_owl\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_owl\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_owl\n", :before => /\*\//, :verbose => true
      end


      def add_fonts
        copy_file "slick.eot", "app/assets/fonts/#{file_name}"
        copy_file "slick.svg", "app/assets/fonts/#{file_name}"
        copy_file "slick.ttf", "app/assets/fonts/#{file_name}"
        copy_file "slick.woff", "app/assets/fonts/#{file_name}"
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_owl'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
