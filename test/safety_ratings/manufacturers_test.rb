require 'test_helper'

module SafetyRatings

  class ManufacturersTest < Minitest::Test

    def setup
      safety_ratings_webmocks
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/SafetyRatings/modelyear/1998?format=json'

      assert_equal expected_url, Nhtsa::SafetyRatings::Manufacturers.new(1998).url
    end

    def test_manufacturers_returns_an_array_of_manufacturers
      Nhtsa::SafetyRatings::Manufacturers.new(2007).manufacturers.each do |manufacturer|
        assert_instance_of Nhtsa::SafetyRatings::Manufacturer, manufacturer
      end
    end

    def test_year_returns_a_year
      assert_instance_of Nhtsa::SafetyRatings::Year, Nhtsa::SafetyRatings::Manufacturers.new(1998).year
    end

    def test_values_returns_an_array_of_manufacturer_names
      manufacturer_names = [
        'ACURA', 'AUDI', 'BENTLEY', 'BMW', 'BUICK', 'CADILLAC', 'CHEVROLET', 'CHRYSLER', 'DODGE',
        'FORD', 'GMC', 'HONDA', 'HUMMER', 'HYUNDAI', 'INFINITI', 'ISUZU', 'JAGUAR', 'JEEP', 'KIA',
        'LAND ROVER', 'LEXUS', 'LINCOLN', 'MAZDA', 'MERCEDES-BENZ', 'MERCURY', 'MINI', 'MITSUBISHI',
        'NISSAN', 'PONTIAC', 'PORSCHE', 'ROLLS-ROYCE', 'SAAB', 'SATURN', 'SUBARU', 'SUZUKI', 'TOYOTA',
        'VOLKSWAGEN', 'VOLVO'
      ]

      assert_equal manufacturer_names, Nhtsa::SafetyRatings::Manufacturers.new(2007).values
    end

    def test_to_s_returns_an_array_of_manufacturer_names
      manufacturer_names = [
        'ACURA', 'AUDI', 'BENTLEY', 'BMW', 'BUICK', 'CADILLAC', 'CHEVROLET', 'CHRYSLER', 'DODGE',
        'FORD', 'GMC', 'HONDA', 'HUMMER', 'HYUNDAI', 'INFINITI', 'ISUZU', 'JAGUAR', 'JEEP', 'KIA',
        'LAND ROVER', 'LEXUS', 'LINCOLN', 'MAZDA', 'MERCEDES-BENZ', 'MERCURY', 'MINI', 'MITSUBISHI',
        'NISSAN', 'PONTIAC', 'PORSCHE', 'ROLLS-ROYCE', 'SAAB', 'SATURN', 'SUBARU', 'SUZUKI', 'TOYOTA',
        'VOLKSWAGEN', 'VOLVO'
      ]

      assert_equal manufacturer_names, Nhtsa::SafetyRatings::Manufacturers.new(2007).to_s
    end

  end

end
