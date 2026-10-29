require 'test_helper'

class RecallsTest < Minitest::Test
  
  def test_that_it_has_the_vehicle_recalls_end_point
    assert_equal '/products/vehicle', ::Nhtsa::Recalls::END_POINT
  end

  def test_taht_it_has_the_recall_param_defined
    assert_equal 'issueType=r', ::Nhtsa::Recalls::RECALL_PARAM
  end

end
