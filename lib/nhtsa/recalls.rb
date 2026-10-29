# https://api.nhtsa.gov/recalls/recallsByVehicle
# https://api.nhtsa.gov/products/vehicle/{XXXX}?issueType=r

require_relative 'recalls/years'
require_relative 'recalls/manufacturers'
require_relative 'recalls/models'
require_relative 'recalls/recalls'
require_relative 'recalls/campaign_recalls'

module Nhtsa
  module Recalls
    END_POINT = '/products/vehicle'
    RECALL_PARAM = '?issueType=r'
  end
end


# https://api.nhtsa.gov/recalls/recallsByVehicle?make=acura&model=rdx&modelYear=2012

# https://api.nhtsa.gov/products/vehicle/modelYears?issueType=r
# https://api.nhtsa.gov/products/vehicle/makes?modelYear=2021&issueType=r
# https://api.nhtsa.gov/products/vehicle/models?modelYear=2010&make=acura&issueType=r

# https://api.nhtsa.gov/recalls/recallsByVehicle?make=acura&model=rdx&modelYear=2012

# https://api.nhtsa.gov/recalls/campaignNumber?campaignNumber=12V176000
