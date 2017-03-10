json.extract! erp_integration, :id, :name, :url, :selected, :token, :created_at, :updated_at
json.url admin_erp_price_integrations_url(erp_integration, format: :json)
