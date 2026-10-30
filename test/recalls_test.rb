require 'test_helper'

class RecallsTest < Minitest::Test
  
  def test_that_it_has_the_vehicle_recalls_end_point
    assert_equal '/products/vehicle', ::Nhtsa::Recalls::END_POINT
  end

  def test_taht_it_has_the_recall_param_defined
    assert_equal 'issueType=r', ::Nhtsa::Recalls::RECALL_PARAM
  end

  def test_that_it_has_the_recall_endpoint
    assert_equal '/recalls/recallsByVehicle', ::Nhtsa::Recalls::RECALL_ENDPOINT
  end

  def test_that_it_has_the_campaign_recall_endpoint
    assert_equal '/recalls/campaignNumber', ::Nhtsa::Recalls::CAMPAIGN_RECALL_ENDPOINT
  end

end
