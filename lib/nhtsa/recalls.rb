# https://api.nhtsa.gov/recalls/recallsByVehicle
# https://api.nhtsa.gov/recalls/campaignNumber
# https://api.nhtsa.gov/products/vehicle/{XXXX}?issueType=r

require_relative 'recalls/years'
require_relative 'recalls/manufacturers'
require_relative 'recalls/models'
require_relative 'recalls/recalls'
require_relative 'recalls/campaign_recalls'

module Nhtsa
  module Recalls
    END_POINT = '/products/vehicle'
    RECALL_PARAM = 'issueType=r'
    RECALL_ENDPOINT = '/recalls/recallsByVehicle'
    CAMPAIGN_RECALL_ENDPOINT = '/recalls/campaignNumber'
  end
end
