require 'test_helper'

class RecallsTest < Minitest::Test

  def setup
    recalls_webmocks
  end

  def test_it_builds_url_as_expected
    expected_url = 'https://api.nhtsa.gov/recalls/recallsByVehicle?modelYear=1998&make=Mitsubishi&model=Galant'

    assert_equal expected_url, Nhtsa::Recalls::Recalls.new(1998, 'Mitsubishi', 'Galant').url
  end

  def test_manufacturer_with_single_name_is_left_unchanged
    assert_equal 'Mitsubishi', Nhtsa::Recalls::Recalls.new(1998, 'Mitsubishi', 'Pajero').manufacturer
  end

  def test_manufacturer_with_double_barrel_name_is_properly_handled
    assert_equal 'Haley-Davidson', Nhtsa::Recalls::Recalls.new(1998, 'Haley-Davidson', 'Superglide').manufacturer
  end

  def test_manufacterer_with_two_names_is_properly_escaped
    assert_equal 'Detroit%20Diesel', Nhtsa::Recalls::Recalls.new(1998, 'Detroit Diesel', 'Camper').manufacturer
  end

  def test_manufactuere_with_mixed_name_is_properly_escaped
    assert_equal 'Mercedes-Benz%20North%20America', Nhtsa::Recalls::Recalls.new(1998, 'Mercedes-Benz North America', 'E Class').manufacturer
  end

  def test_manufacturer_with_multiple_spaces_is_properly_escaped
    assert_equal 'Hyundai%20Kia%20North%20America', Nhtsa::Recalls::Recalls.new(1998, 'Hyundai Kia North America', 'Veloster').manufacturer
  end

  def test_model_handles_single_alphanumeric_names
    assert_equal '3000GT', Nhtsa::Recalls::Recalls.new(1998, 'Mitsubishi', '3000GT').model
  end

  def test_model_handles_double_barrel_alphanumeric_names
    assert_equal 'Galant%20VR-4', Nhtsa::Recalls::Recalls.new(1998, 'Mitsubishi', 'Galant VR-4').model
  end

  def test_model_handles_multiple_alphanumeric_names
    assert_equal 'Lancer%20Evolution%206%20TME', Nhtsa::Recalls::Recalls.new(1998, 'Mitsubishi', 'Lancer Evolution 6 TME').model
  end

  def test_ratings_should_return_an_array_of_recalls
    recalls_array = [
      {
        "Manufacturer" => "MITSUBISHI AMERICA",
        "NHTSACampaignNumber" => "00V421001",
        "parkIt" => false,
        "parkOutSide" => false,
        "overTheAirUpdate" => false,
        "NHTSAActionNumber" => "RQ00015",
        "ReportReceivedDate" => "18/12/2000",
        "Component" => "SUSPENSION:FRONT:CONTROL ARM:LOWER BALL JOINT",
        "Summary" => "VEHICLE DESCRIPTION:  PASSENGER VEHICLES.  IF THE RUBBER BOOTS ON THE LOWER LATERAL ARM BALL JOINTS OF THE FRONT SUSPENSION WERE DAMAGED DURING ASSEMBLY, DIRT AND WATER CAN INTRUDE.  ALSO, MMC HAS ADDED THE POTENTIAL OF LEAKING MOISTURE, WHICH CAN CAUSE THE BALL STUD TO CORRODE.",
        "Consequence" => "THIS CONDITION COULD CAUSE THE LOWER LATERAL ARM BALL JOINT TO SEPARATE, INCREASING THE RISK OF A VEHICLE CRASH.  THIS CAMPAIGN SUPERCEDES MMC'S PREVIOUS SAFETY RECALL CAMPAIGN, SEE 99V-066.",
        "Remedy" => "DEALERS WILL INSPECT THE LOWER LATERAL ARM BALL JOINT FOR WEAR.  BALL JOINTS THAT EXHIBIT WEAR BEYOND THE ESTABLISHED TOLERANCE WILL BE REPLACED WITH NEWLY DESIGNED LATERAL ARM BALL JOINTS.  BALL JOINTS THAT ARE WITHIN THE ESTABLISHED TOLERANCE WILL BE CLEANED AND A SPECIAL SEALANT WILL BE APPLIED TO PREVENT INTRUSION OF MOISTURE.",
        "Notes" => "OWNER NOTIFICATION WILL BE CONDUCTED IN PHASES.  THE FIRST PHASE BEGAN APRIL 2, 2001, AND THE FINAL PHASE WILL BE COMPLETED ON SEPTEMBER 3, 2001.     OWNERS WHO TAKE THEIR VEHICLES TO AN AUTHORIZED DEALER ON AN AGREED UPON SERVICE DATE AND DO NOT RECEIVE THE FREE REMEDY WITHIN A REASONABLE TIME SHOULD CONTACT MITSUBISHI AMERICA AT 1-888-MITSU-2001 (1-888-648-7820).    ALSO CONTACT THE NATIONAL HIGHWAY TRAFFIC SAFETY ADMINISTRATION'S AUTO SAFETY HOTLINE AT 1-888-DASH-2-DOT (1-888-327-4236).",
        "ModelYear" => "1998",
        "Make" => "MITSUBISHI",
        "Model" => "GALANT"
      },
      {
        "Manufacturer" => "AIRTEX PRODUCTS",
        "NHTSACampaignNumber" => "07E055000",
        "ReportReceivedDate" => "26/07/2007",
        "Component" => "FUEL SYSTEM, GASOLINE:DELIVERY:FUEL PUMP",
        "Summary" => "CERTAIN AIRTEX FUEL PUMP MODULE ASSEMBLIES, P/N E7081H, SOLD FOR USE AS REPLACEMENT EQUIPMENT FOR THE VEHICLES LISTED ABOVE.  THE WALL OF THE FLARED FITTING OF THE FUEL PUMP IS NOT THICK ENOUGH TO PREVENT THE MATING THREADED FITTINGS FROM BOTTOMING OUT BEFORE AN ADEQUATE SEAL IS ACHIEVED.  THIS CONDITION MAY RESULT IN LEAKAGE OF FUEL AT THE CONNECTION OF THE VEHICLE FUEL LINE AND THE FUEL PUMP MODULE ASSEMBLY.",
        "Consequence" => "IN THE PRESENCE OF AN IGNITION SOURCE, A FUEL LEAK COULD RESULT IN A FIRE.",
        "Remedy" => "AIRTEX WILL NOTIFY OWNERS AND REPLACE THE FUEL PUMPS FREE OF CHARGE.  THE RECALL IS EXPECTED TO BEGIN DURING JULY 2007.  OWNERS CAN CONTACT AIRTEX AUTOMOTIVE AT 800-880-3056.",
        "Notes" => "AIRTEX RECALL NO. FP072007-1.  THIS RECALL ONLY PERTAINS TO AFTERMARKET REPLACEMENT EQUIPMENT AND HAS NO RELATION TO ANY ORIGINAL EQUIPMENT INSTALLED ON VEHICLES MANUFACTURED BY DAIMLERCHRYSLER OR MITSUBISHI.  CUSTOMERS MAY CONTACT THE NATIONAL HIGHWAY TRAFFIC SAFETY ADMINISTRATION'S VEHICLE SAFETY HOTLINE AT 1-888-327-4236 (TTY: 1-800-424-9153); OR GO TO HTTP://WWW.SAFERCAR.GOV.",
        "ModelYear" => "1998",
        "Make" => "MITSUBISHI",
        "Model" => "GALANT"
      }
    ]

    assert_equal recalls_array, Nhtsa::Recalls::Recalls.new(1998, 'Mitsubishi', 'Galant').recalls
  end

end
