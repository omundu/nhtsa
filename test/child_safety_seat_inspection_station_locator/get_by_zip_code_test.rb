require 'test_helper'

module ChildSafetySeatInspectionStationLocator

  class GetByZipCodeTest < Minitest::Test

    def setup
      inspection_location_webmocks
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/CSSIStation/zip/12345'

      assert_equal expected_url, Nhtsa::ChildSafetySeatInspectionStationLocator::GetByZipCode.new(12345).url
    end

    def test_it_adds_the_spanish_filter_to_url_when_specified
      expected_url = 'https://api.nhtsa.gov/CSSIStation/zip/12345/lang/spanish'

      assert_equal expected_url, Nhtsa::ChildSafetySeatInspectionStationLocator::GetByZipCode.new(12345, {spanish: true}).url
    end

    def test_it_adds_the_cpsweek_filter_to_url_when_specified
      expected_url = 'https://api.nhtsa.gov/CSSIStation/zip/12345/cpsweek'

      assert_equal expected_url, Nhtsa::ChildSafetySeatInspectionStationLocator::GetByZipCode.new(12345, {cpsweek: true}).url
    end

    def test_it_adds_the_spanish_and_cpsweek_filters_to_url_when_specified
      expected_url = 'https://api.nhtsa.gov/CSSIStation/zip/12345/cpsweek/lang/spanish'

      assert_equal expected_url, Nhtsa::ChildSafetySeatInspectionStationLocator::GetByZipCode.new(12345, {spanish: true, cpsweek: true}).url
    end

    def test_inspection_stations_returns_an_array_of_location_hashes
      # https://api.nhtsa.gov/CSSIStation/zip/63640
      expected_location_hashes = [
        {
          "ContactFirstName" => nil, 
          "ContactLastName" => nil, 
          "Organization" => "St. Francois County Sheriff's Department", 
          "AddressLine1" => "1550 Doubet Road", 
          "City" => "Farmington", 
          "State" => "MO", 
          "Zip" => "63640", 
          "Email" => nil, 
          "Fax" => nil, 
          "Phone1" => "573-756-3252", 
          "CPSWeekEventFlag" => "No", 
          "LastUpdatedDate" => "2026-08-13T04:00:00Z", 
          "MobileStationFlag" => "Yes", 
          "CountiesServed" => nil, 
          "LocationLatitude" => 37.7619018, 
          "LocationLongitude" => -90.4384765
        },
        {
          "ContactFirstName" => "TJ", 
          "ContactLastName" => "Isgrig", 
          "Organization" => "St. Francois County Ambulance District", 
          "AddressLine1" => "820 Electric St", 
          "City" => "Farmington", 
          "State" => "MO", 
          "Zip" => "63640", 
          "Email" => "pounds@sfcad.org", 
          "Fax" => nil, 
          "Phone1" => "573-431-0030", 
          "CPSWeekEventFlag" => "No", 
          "LastUpdatedDate" => "2013-10-30T04:00:00Z", 
          "MobileStationFlag" => "No", 
          "CountiesServed" => "St. Francois and surrounding area", 
          "LocationLatitude" => 37.799507, 
          "LocationLongitude" => -90.437326
        }
      ]

      assert_equal expected_location_hashes, Nhtsa::ChildSafetySeatInspectionStationLocator::GetByZipCode.new(63640).inspection_stations
    end

  end

end
