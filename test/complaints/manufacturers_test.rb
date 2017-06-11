require 'test_helper'

module Complaints
  class ManufacturersTest < Minitest::Test

    def test_it_builds_url_as_expected
      expected_url = "https://webapi.nhtsa.gov/api/Complaints/vehicle/2014?format=json"

      assert_equal expected_url, Nhtsa::Complaints::Manufacturers.new(2014).url
    end

    def test_years_returns_an_array_of_manufacturer_names
      manufacturer_names = [".", "ACURA", "AERO", "AIRSTREAM", "ALFA", "ALFA ROMEO", "ALLURE", "AM GENERAL", "AMTRAN", "ATHEY", "AUDI", "BEST", "BLUE BIRD", "BMW", "BOSS HOSS", "BOUNDER", "BUELL", "BUICK", "CADILLAC", "CASITA", "CHEVROLET", "CHRYSLER", "COACHMEN", "COLEMAN", "COLLINS", "COUNTRY COACH", "CRAFTSMEN", "DAEWOO", "DAEWOO PUERTO RICO", "DAMON", "DODGE", "DOLPHIN", "DUCATI", "DUTCH", "DUTCHMEN", "EAGLE", "ELDORADO", "ELECTRIC TRANSIT, INC.", "EXPLORER VAN", "FERRARI", "FLEETWOOD", "FLXIBLE", "FORD", "FOREST RIVER", "FOUR WINDS", "FREIGHTLINER", "GENIE", "GEO", "GEORGIE BOY", "GIRARDIN", "GMC", "GREAT DANE", "GULF STREAM", "GULF TOYOTA", "HARLEY-DAVIDSON", "HARNEY", "HAULMARK", "HOLIDAY RAMBLER", "HOME AND PARK", "HONDA", "HYUNDAI", "IC", "INFINITI", "INTERNATIONAL", "INTERNATIONAL HARVESTER", "ISUZU", "ITASCA", "JAGUAR", "JAYCO", "JEEP", "KAWASAKI", "KENWORTH", "KEYSTONE", "KIA", "KING OF THE ROAD", "LAND ROVER", "LEXUS", "LINCOLN", "LOTUS", "LUFKIN", "MACK", "MARK III", "MAZDA", "MCI", "MERCEDES BENZ", "MERCURY", "MITSUBISHI", "MITSUBISHI CARIBBEAN", "MITSUBISHI FUSO", "MONACO COACH", "MOTO GUZZI", "NATIONAL RV", "NAVISTAR", "NEOPLAN", "NEW FLYER", "NEW GOSHEN COACH", "NEWMAR", "NISSAN", "NU WA", "OLDSMOBILE", "ORANGE BLOSSOM", "ORION", "OVERLAND", "PACE ARROW", "PETERBILT", "PLYMOUTH", "POLARIS", "PONTIAC", "PORSCHE", "PREVOST", "REGENCY", "RELIANCE TRAILER", "REXHALL", "RIALTA", "ROLLS-ROYCE", "SAAB", "SAFARI", "SAFARI COACH", "SATURN", "SHASTA", "SKYLINE", "STRICK", "SUBARU", "SUN VALLEY", "SUNDOWNER", "SUNNYBROOK", "SUZUKI", "THOMAS", "THOR", "TIARA", "TIFFIN", "TITAN", "TOYOTA", "TRADEWINDS", "TRAIL KING", "TRAILER", "TRIUMPH", "TROPI CAL", "UD", "ULTIMATE", "UNITED", "UNKNOWN", "UTILITY", "VAN HOOL", "VIKING", "VOLKSWAGEN", "VOLVO", "WABASH", "WESTERN", "WESTERN STAR", "WINNEBAGO", "YAMAHA"]

      assert_equal manufacturer_names, Nhtsa::Complaints::Manufacturers.new(1998).manufacturers
    end

  end
end
