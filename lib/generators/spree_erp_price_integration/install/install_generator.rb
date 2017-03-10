module SpreeErpPriceIntegration
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_erp_price_integration\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_erp_price_integration\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_erp_price_integration\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_erp_price_integration\n", :before => /\*\//, :verbose => true
      end

      def create_controllers_file
        create_file "app/controllers/spree/admin/erp_price_integrates_controller.rb"
      end

      def create_model_file
        create_file "app/models/spree/erp_price_integration.rb"
      end

      def create_view_file
        create_file "app/views/spree/admin/erp_price_integrates/edit.html.erb"
        create_file "app/views/spree/admin/erp_price_integrates/_erp_price_integrates.json.jbuilder"
        create_file "app/views/spree/admin/erp_price_integrates/_form.html.erb"
        create_file "app/views/spree/admin/erp_price_integrates/index.html.erb"
        create_file "app/views/spree/admin/erp_price_integrates/index.json.jbuilder"
        create_file "app/views/spree/admin/erp_price_integrates/new.html.erb"
        create_file "app/views/spree/admin/erp_price_integrates/show.html.erb"
        create_file "app/views/spree/admin/erp_price_integrates/show.json.jbuilder"
      end

      def add_override_main_menu
        create_file "app/overrides/add_erp_price_with_spree.rb"
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_erp_price_integration'
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
