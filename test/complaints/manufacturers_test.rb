require 'test_helper'

module Complaints

  class ManufacturersTest < Minitest::Test

    def setup
      complaints_webmocks
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/products/vehicle/makes?modelYear=2014&issueType=c'

      assert_equal expected_url, Nhtsa::Complaints::Manufacturers.new(2014).url
    end

    def test_years_returns_an_array_of_manufacturer_names
      manufacturer_names = [
        'A.C.E.', 'ACURA', 'AIRSTREAM', 'ALINER', 'ALUMA', 'ALUMINUM TRAILER CO', 'AM GENERAL', 'AMERICAN COACH', 'AMERITRANS', 'ARTIC FOX', 'ASTON MARTIN',
        'AUDI', 'AUTOCAR', 'BIG TEX', 'BMW', 'BRAMMO', 'BRAUNABILITY', 'BUICK', 'CADILLAC', 'CAN-AM', 'CARRY-ON', 'CHAMPION', 'CHEVROLET', 'CHRYSLER', 'CM TRAILERS',
        'COACHMEN', 'CORN PRO', 'COVERED WAGON TRAILERS', 'CROSSROADS', 'CRUISER RV', 'DITCH WITCH', 'DODGE', 'DODGEN', 'DOUBLE R TRAILERS', 'DRV', 'DUCATI',
        'DUTCHMEN', 'ECLIPSE', 'ELPERS', 'ENTEGRA', 'EVERGREEN', 'EZ LOADER', 'FCCC', 'FERRARI', 'FIAT', 'FLEETWOOD', 'FORD', 'FOREST RIVER', 'FOX MOUNTAIN',
        'FREIGHTLINER', 'GENUINE SCOOTER', 'GILLIG', 'GLOBAL FACTORY PRODUCTS', 'GMC', 'GRAND DESIGN', 'GULF STREAM', 'HARLEY-DAVIDSON', 'HAUL MASTER', 'HAULMARK',
        'HEARTLAND', 'HONDA', 'HUSQVARNA', 'HYUNDAI', 'IC BUS', 'INDIAN', 'INFINITI', 'INTERNATIONAL', 'ITASCA', 'JAGUAR', 'JAYCO', 'JEEP', 'KAWASAKI', 'KENWORTH',
        'KEYSTONE', 'KIA', 'KME', 'KTM', 'KYMCO', 'KZRV', 'LAKOTA', 'LAMBORGHINI', 'LANCE', 'LAND ROVER', 'LARK', 'LEXUS', 'LINCOLN', 'LOAD MAX', 'LOTUS', 'MACK',
        'MASERATI', 'MAZDA', 'MCLAREN', 'MERCEDES BENZ', 'MERCEDES-BENZ', 'MINI', 'MITSUBISHI', 'MOTO GUZZI', 'NEWMAR', 'NISSAN', 'NORTHLAND', 'OPEN RANGE', 'PALOMINO',
        'PETERBILT', 'PIAGGIO', 'PILE-ON TRAILERS', 'POLARIS', 'PONTIAC', 'PORSCHE', 'PRIME TIME', 'R&R TRAILER', 'RAM', 'RANCE ALUMINUM TRAILER', 'RENAULT', 'RENEGADE',
        'ROADTREK', 'ROCK CITY', 'ROKETA', 'ROLLS-ROYCE', 'SCION', 'SEA-DOO', 'SHADOW', 'SHASTA', 'SHORELAND\'R', 'SMART', 'SOUTH GEORGIA', 'SPARTAN', 'STALLION',
        'STARCRAFT', 'SUBARU', 'SUZUKI', 'TAOTAO', 'TEREX', 'TESLA', 'THOR', 'THOR MOTOR COACH', 'TIFFIN', 'TIMBER RIDGE', 'TOYOTA', 'TRAILMANOR', 'TRIUMPH', 'VANGUARD',
        'VICTORY', 'VOLKSWAGEN', 'VOLVO', 'WABASH NATIONAL', 'WESTERN STAR', 'WHEELED COACH', 'WINNEBAGO', 'YAMAHA', 'ZERO', 'ZEV'
      ]

      assert_equal manufacturer_names, Nhtsa::Complaints::Manufacturers.new(1998).manufacturers
    end

  end

end
