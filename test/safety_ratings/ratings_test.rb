require 'test_helper'

module SafetyRatings

  class RatingsTest < Minitest::Test

    def setup
      safety_ratings_webmocks
    end

    def test_initialize_requires_input
      assert_raises(ArgumentError) { Nhtsa::SafetyRatings::Ratings.new }
    end

    def test_initialize_takes_varying_arguements
      assert_instance_of Nhtsa::SafetyRatings::Ratings, Nhtsa::SafetyRatings::Ratings.new(3832)
      assert_instance_of Nhtsa::SafetyRatings::Ratings, Nhtsa::SafetyRatings::Ratings.new(3832, 3834)
      assert_instance_of Nhtsa::SafetyRatings::Ratings, Nhtsa::SafetyRatings::Ratings.new(3832, 3834, 3881)
      assert_instance_of Nhtsa::SafetyRatings::Ratings, Nhtsa::SafetyRatings::Ratings.new(3832, 3834, 3881, 420)
    end

    def test_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/SafetyRatings/VehicleId/420?format=json'

      assert_equal expected_url, Nhtsa::SafetyRatings::Ratings.new(420).url(420)
    end

    def test_builds_urls_as_expected
      expected_urls = [
        'https://api.nhtsa.gov/SafetyRatings/VehicleId/318?format=json',
        'https://api.nhtsa.gov/SafetyRatings/VehicleId/319?format=json',
        'https://api.nhtsa.gov/SafetyRatings/VehicleId/320?format=json',
        'https://api.nhtsa.gov/SafetyRatings/VehicleId/321?format=json'
      ]

      assert_equal expected_urls, Nhtsa::SafetyRatings::Ratings.new(318, 319, 320, 321).urls
    end

    def test_ratings_returns_an_array_of_ratings
      Nhtsa::SafetyRatings::Ratings.new(420).ratings.each do |rating|
        assert_instance_of Nhtsa::SafetyRatings::Rating, rating
      end
    end

    def test_values_should_return_a_harsh_of_ratings
      ratings_hash = {
        "OverallRating"=>"Not Rated",
        "OverallFrontCrashRating"=>"Not Rated",
        "FrontCrashDriversideRating"=>"4",
        "FrontCrashPassengersideRating"=>"5",
        "OverallSideCrashRating"=>"Not Rated",
        "SideCrashDriversideRating"=>"5",
        "SideCrashPassengersideRating"=>"5",
        "combinedSideBarrierAndPoleRating-Front"=>"Not Rated",
        "combinedSideBarrierAndPoleRating-Rear"=>"Not Rated",
        "sideBarrierRating-Overall"=>"Not Rated",
        "RolloverRating"=>"Not Rated",
        "RolloverRating2"=>"4",
        "RolloverPossibility"=>0.0,
        "RolloverPossibility2"=>0.107,
        "dynamicTipResult"=>" ",
        "SidePoleCrashRating"=>"Not Rated",
        "NHTSAElectronicStabilityControl"=>"No",
        "NHTSAForwardCollisionWarning"=>"No",
        "NHTSALaneDepartureWarning"=>"No",
        "ComplaintsCount"=>24,
        "RecallsCount"=>1,
        "InvestigationCount"=>0,
        "ModelYear"=>2007,
        "Make"=>"MITSUBISHI",
        "Model"=>"GALANT",
        "VehicleDescription"=>"2007 Mitsubishi Galant 4-DR. w/SAB",
        "VehicleId"=>2249
      }

      assert_equal [ratings_hash], Nhtsa::SafetyRatings::Ratings.new(3832).values
    end

    def test_to_s
      ratings_string_output = "OverallRating\n\tNot Rated\nOverallFrontCrashRating\n\tNot Rated\nFrontCrashDriversideRating\n\t4\nFrontCrashPassengersideRating\n\t5\nOverallSideCrashRating\n\tNot Rated\nSideCrashDriversideRating\n\t5\nSideCrashPassengersideRating\n\t5\ncombinedSideBarrierAndPoleRating-Front\n\tNot Rated\ncombinedSideBarrierAndPoleRating-Rear\n\tNot Rated\nsideBarrierRating-Overall\n\tNot Rated\nRolloverRating\n\tNot Rated\nRolloverRating2\n\t4\nRolloverPossibility\n\t0.0\nRolloverPossibility2\n\t0.107\ndynamicTipResult\n\t \nSidePoleCrashRating\n\tNot Rated\nNHTSAElectronicStabilityControl\n\tNo\nNHTSAForwardCollisionWarning\n\tNo\nNHTSALaneDepartureWarning\n\tNo\nComplaintsCount\n\t24\nRecallsCount\n\t1\nInvestigationCount\n\t0\nModelYear\n\t2007\nMake\n\tMITSUBISHI\nModel\n\tGALANT\nVehicleDescription\n\t2007 Mitsubishi Galant 4-DR. w/SAB\nVehicleId\n\t2249\n"

      assert_equal ratings_string_output, Nhtsa::SafetyRatings::Ratings.new(3832).to_s
    end

    def test_initialize_takes_multiple_inputs
      assert_instance_of Nhtsa::SafetyRatings::Ratings, Nhtsa::SafetyRatings::Ratings.new(3832, 3834, 3881)
    end

  end
  
end
