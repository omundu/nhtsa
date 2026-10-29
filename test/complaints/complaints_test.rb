require 'test_helper'

module Complaints

  class ComplaintsTest < Minitest::Test

    def setup
      complaints_webmock
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/complaints/complaintsByVehicle?modelYear=2015&make=Mitsubishi&model=Lancer'

      assert_equal expected_url, Nhtsa::Complaints::Complaints.new(2015, 'Mitsubishi', 'Lancer').url
    end

    def test_manufacturer_escapes_names_properly
      assert_equal 'Mitsubishi', Nhtsa::Complaints::Complaints.new(2015, 'Mitsubishi', 'Lancer').manufacturer
    end

    def test_manufacturer_escapes_names_with_spaces_properly
      assert_equal 'Thomas%20Built%20Buses', Nhtsa::Complaints::Complaints.new(2015, 'Thomas Built Buses', 'Camper').manufacturer
    end

    def test_maodel_escapes_names_properly
      assert_equal 'Lancer', Nhtsa::Complaints::Complaints.new(2015, 'Mitsubishi', 'Lancer').model
    end

    def test_maodel_escapes_names_with_spaces_properly
      assert_equal 'Lancer%20Evolution%206%20GSX', Nhtsa::Complaints::Complaints.new(2015, 'Mitsubishi', 'Lancer Evolution 6 GSX').model
    end

    def test_trim_descriptions_returns_an_array_of_complaint_hashes
      array_of_complaint_hashes = [
        {
          "odiNumber" => 849082, 
          "manufacturer" => "BMW of North America, LLC", 
          "crash" => true, 
          "fire" => false, 
          "numberOfInjuries" => 0, 
          "numberOfDeaths" => 0, 
          "dateOfIncident" => "09/25/1999", 
          "dateComplaintFiled" => "09/29/1999", 
          "vin" => "", 
          "components" => "AIR BAGS", 
          "summary" => "CONSUMER WAS DRIVING AT 10 MPH. WHILE PULLING FROM A STOP LIGHT ANOTHER VEHICLE HIT THE CONSUMER'S VEHICLE ON THE RIGHT. UPON IMPACT,  DRIVER'S SIDE AND PASSENGER'S SIDE AIR BAGS DIDN'T DEPLOY.  THE VEHICLE WAS STRUCK AT A HIGH RATE OF SPEED.  *AK", 
          "products" => [
            {
              "type" => "Vehicle", 
              "productYear" => "1998", 
              "productMake" => "BMW", 
              "productModel" => "318", 
              "manufacturer" => "BMW of North America, LLC"
            }
          ]
        },
        {
          "odiNumber" => 707631, 
          "manufacturer" => "BMW of North America, LLC", 
          "crash" => false, 
          "fire" => false, 
          "numberOfInjuries" => 0, 
          "numberOfDeaths" => 0, 
          "dateOfIncident" => "06/08/1999", 
          "dateComplaintFiled" => "06/17/1999", 
          "vin" => "WBACG7327WA", 
          "components" => "POWER TRAIN", 
          "summary" => "TRANSMISSION KEPT POPPING OUT OF GEAR.  ORIGINAL AND REPLACEMENT TRANSMISSION FAILED IN 1 YEAR.  BMW STATES THAT IT ISN'T WORTHY OF RECALL BECAUSE IT IS TOO RARE.  IT CAN'T BE THAT RARE IF IT HAPPENED TO ME TWICE, AND  TO A FRIEND ONCE IN THE LAST YEAR. *AK", 
          "products" => [
            {
              "type" => "Vehicle", 
              "productYear" => "1998", 
              "productMake" => "BMW", 
              "productModel" => "318", 
              "manufacturer" => "BMW of North America, LLC"
            }
          ]
        },
        {
          "odiNumber" => 822392, 
          "manufacturer" => "BMW of North America, LLC", 
          "crash" => true, 
          "fire" => false, 
          "numberOfInjuries" => 0, 
          "numberOfDeaths" => 0, 
          "dateOfIncident" => "03/03/1998", 
          "dateComplaintFiled" => "05/05/1998", 
          "vin" => "WBACC0329WE", 
          "components" => "VEHICLE SPEED CONTROL", 
          "summary" => "ON TWO SEPARATE OCCASIONS THE VEHICLE  SUDDENLY ACCELERATED, CAUSING A  COLLISION. THE DEALER HAS BEEN NOTIFIED.   *AK", 
          "products" => [
            {
              "type" => "Vehicle", 
              "productYear" => "1998", 
              "productMake" => "BMW", 
              "productModel" => "318", 
              "manufacturer" => "BMW of North America, LLC"
            }
          ]
        }
      ]

      assert_equal array_of_complaint_hashes, Nhtsa::Complaints::Complaints.new(1998, "BMW", "318").complaints
    end

  end
end
