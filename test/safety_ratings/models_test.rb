require 'test_helper'

module SafetyRatings

  class ModelsTest < Minitest::Test

    def setup
      safety_ratings_webmocks
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/SafetyRatings/modelyear/2015/make/Mitsubishi?format=json'

      assert_equal expected_url, Nhtsa::SafetyRatings::Models.new(2015, 'Mitsubishi').url
    end

    def test_it_builds_url_as_expected_for_a_manufacturer_with_two_names
      expected_url = 'https://api.nhtsa.gov/SafetyRatings/modelyear/2015/make/Land%20Rover?format=json'

      assert_equal expected_url, Nhtsa::SafetyRatings::Models.new(2015, 'Land Rover').url
    end

    def test_it_builds_url_as_expected_for_a_manufacturer_with_double_barrel_names
      expected_url = 'https://api.nhtsa.gov/SafetyRatings/modelyear/2015/make/Mercedes-Benz?format=json'

      assert_equal expected_url, Nhtsa::SafetyRatings::Models.new(2015, 'Mercedes-Benz').url
    end

    def test_models_returns_an_array_of_models
      Nhtsa::SafetyRatings::Models.new(2007, 'Mitsubishi').models.each do |model|
        assert_instance_of Nhtsa::SafetyRatings::Model, model
      end
    end

    def test_values_returns_an_array_of_model_names
      model_names = ['ECLIPSE', 'ECLIPSE SPYDER', 'ENDEAVOR', 'GALANT', 'LANCER', 'OUTLANDER', 'RAIDER CLUB', 'RAIDER QUAD']

      assert_equal model_names, Nhtsa::SafetyRatings::Models.new(2007, 'Mitsubishi').model_names
    end

    def test_values_returns_an_empty_array_if_models_are_not_on_record
      model_names = []

      assert_equal model_names, Nhtsa::SafetyRatings::Models.new(2007, 'Eagle').model_names
    end

    def test_to_s_returns_a_string_representation_of_the_models
      model_string = ['ECLIPSE', 'ECLIPSE SPYDER', 'ENDEAVOR', 'GALANT', 'LANCER', 'OUTLANDER', 'RAIDER CLUB', 'RAIDER QUAD'].map { |model| "2007 Mitsubishi #{model}" }.join('\n')

      assert_equal model_string, Nhtsa::SafetyRatings::Models.new(2007, 'Mitsubishi').to_s
    end

  end

end
