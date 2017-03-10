class ErpPriceIntegration < ActiveRecord::Base
  validates_presence_of :name, :url, :token
end
