require 'test_helper'

class ComplaintsTest < Minitest::Test
  
  def test_that_it_has_the_vehicle_complaints_end_point
    assert_equal '/products/vehicle', ::Nhtsa::Complaints::END_POINT
  end

  def test_that_it_has_the_vehicle_complaint_param_end_point
    assert_equal 'issueType=c', ::Nhtsa::Complaints::COMPLAINT_PARAM
  end

  def test_that_it_has_the_vehicle_complaint_end_point
    assert_equal '/complaints/complaintsByVehicle', ::Nhtsa::Complaints::COMPLAINT_ENDPOINT
  end

  def test_that_it_has_the_vehicle_complaint_odi_end_point
    assert_equal '/complaints/odinumber', ::Nhtsa::Complaints::COMPLAINT_ODI_ENDPOINT
  end

end
