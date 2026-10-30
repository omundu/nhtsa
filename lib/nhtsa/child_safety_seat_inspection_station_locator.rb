# NHTSA Child Safety Seat Inspection Station Locator
# https://api.nhtsa.gov/CSSIStation/(zip||)/{XXX}(/{cpsweek|lang/spanish})

require_relative 'child_safety_seat_inspection_station_locator/get_by_zip_code'
require_relative 'child_safety_seat_inspection_station_locator/get_by_state'
require_relative 'child_safety_seat_inspection_station_locator/get_by_geo_location'

module Nhtsa
  module ChildSafetySeatInspectionStationLocator
    END_POINT = '/CSSIStation'
    CPS_WEEK = '/cpsweek'
    SPANISH = '/lang/spanish'
  end
end
