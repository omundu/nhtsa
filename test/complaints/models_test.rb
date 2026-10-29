require 'test_helper'

module Complaints

  class ModelsTest < Minitest::Test

    def setup
      complaints_webmock
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/products/vehicle/models?modelYear=2015&make=Mitsubishi&issueType=c'

      assert_equal expected_url, Nhtsa::Complaints::Models.new(2015, 'Mitsubishi').url
    end

    def test_manufacturer_escapes_single_names
      assert_equal 'Mitsubishi', Nhtsa::Complaints::Models.new(2015, 'Mitsubishi').manufacturer
    end

    def test_manufacturer_escapes_spaces
      assert_equal 'Thomas%20Built%20Buses', Nhtsa::Complaints::Models.new(2015, 'Thomas Built Buses').manufacturer
    end

    def test_models_returns_an_array_of_model_names
      model_names = ['GALANT', 'ECLIPSE', 'MONTERO', 'SPYDER', '3000GT', 'DIAMANTE', 'MIRAGE', 'MONTERO SPORT']

      assert_equal model_names, Nhtsa::Complaints::Models.new(1998, 'Mitsubishi').models
    end

  end

end
