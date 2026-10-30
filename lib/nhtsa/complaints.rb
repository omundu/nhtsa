# NHTSA's Office of Defects Investigation (ODI) - Complaints
# https://api.nhtsa.gov/complaints/odinumber?odinumber={XXXXX}
# https://api.nhtsa.gov/complaints/complaintsByVehicle?make=acura&model=rdx&modelYear=2012
# https://api.nhtsa.gov/products/vehicle/{modelYears|makes|models}?{modelYear=2010&make=acura&}issueType=c

require_relative 'complaints/years'
require_relative 'complaints/manufacturers'
require_relative 'complaints/models'
require_relative 'complaints/complaints'
require_relative 'complaints/complaints_by_odi_number'

module Nhtsa
  module Complaints
    END_POINT = '/products/vehicle'
    COMPLAINT_PARAM = 'issueType=c'
    COMPLAINT_ENDPOINT = '/complaints/complaintsByVehicle'
    COMPLAINT_ODI_ENDPOINT = '/complaints/odinumber'
  end
end
