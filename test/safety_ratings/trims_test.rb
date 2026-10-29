require 'test_helper'

module SafetyRatings

  class TrimsTest < Minitest::Test

    def setup
      safety_ratings_webmocks
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/SafetyRatings/modelyear/2015/make/Mitsubishi/model/Lancer?format=json'

      assert_equal expected_url, Nhtsa::SafetyRatings::Trims.new(2015, 'Mitsubishi', 'Lancer').url
    end

    def test_trim_descriptions_returns_an_array_of_a_single_description
      expected_trim_descriptions = [
        '2007 Mitsubishi Galant 4-DR. w/SAB'
      ]

      assert_equal expected_trim_descriptions, Nhtsa::SafetyRatings::Trims.new(2007, 'Mitsubishi', 'Galant').descriptions
    end

    def test_trim_descriptions_returns_an_array_of_multiple_descriptions
      expected_trim_descriptions = [
        '2013 Mitsubishi Lancer 4 DR FWD',
        '2013 Mitsubishi Lancer 4 DR AWD'
      ]

      assert_equal expected_trim_descriptions, Nhtsa::SafetyRatings::Trims.new(2013, 'Mitsubishi', 'Lancer').descriptions
    end

    def test_trim_descriptions_handles_an_empty_collection
      expected_trim_descriptions = []

      assert_equal expected_trim_descriptions, Nhtsa::SafetyRatings::Trims.new(2007, 'Mitsubishi', 'Pajero').descriptions
    end

    def test_trim_ids_returns_an_array_of_a_single_id
      expected_trim_ids = [2249]

      assert_equal expected_trim_ids, Nhtsa::SafetyRatings::Trims.new(2007, 'Mitsubishi', 'Galant').ids
    end

    def test_trim_ids_returns_an_array_of_multiple_ids
      expected_trim_ids = [7198, 7197]

      assert_equal expected_trim_ids, Nhtsa::SafetyRatings::Trims.new(2013, 'Mitsubishi', 'Lancer').ids
    end

    def test_trim_ids_handles_an_empty_collection
      expected_trim_ids = []

      assert_equal expected_trim_ids, Nhtsa::SafetyRatings::Trims.new(2007, 'Mitsubishi', 'Pajero').ids
    end

    def test_trims_returns_an_array_of_trims
      Nhtsa::SafetyRatings::Trims.new(2013, 'Mitsubishi', 'Lancer').trims.each do |trim|
        assert_instance_of Nhtsa::SafetyRatings::Trim, trim
      end
    end

    def test_to_s_returns_a_string_representation_of_the_trims
      expected_trim_descriptions = "id: 7198\n\t2013 Mitsubishi Lancer 4 DR FWD\n\nid: 7197\n\t2013 Mitsubishi Lancer 4 DR AWD"

      assert_equal expected_trim_descriptions, Nhtsa::SafetyRatings::Trims.new(2013, 'Mitsubishi', 'Lancer').to_s
    end

  end

end
