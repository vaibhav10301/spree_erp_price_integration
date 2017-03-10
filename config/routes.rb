Spree::Core::Engine.routes.draw do
  namespace :admin, path: Spree.admin_path do
    resources :erp_price_integrations

  end
  put 'erp_integrations/:id/source-update' => 'erp_price_integrations#update_integration_source'
end
