module RequestStubs

  def safety_ratings_webmocks

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/years.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2007').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/manufacturers.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2007/make/Mitsubishi').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/models.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2007/make/Eagle').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/blank.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2007/make/Mitsubishi/model/Galant').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/trim.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2013/make/Mitsubishi/model/Lancer').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/trims.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2007/make/Mitsubishi/model/Pajero').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/blank.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/3832').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/ratings.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/3834').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/ratings.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/3881').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/ratings.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/420').
      with(query: {'format' => 'json'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/safety_ratings/ratings.json')).read)

  end

  def recalls_webmock
  
    stub_request(:get, 'https://api.nhtsa.gov/products/vehicle/modelYears').
      with(query: {'issueType' => 'r'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/recalls/years.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/products/vehicle/makes').
      with(query: {'issueType' => 'r', 'modelYear' => '1998'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/recalls/manufacturers.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/products/vehicle/models').
      with(query: {'issueType' => 'r', 'modelYear' => '1998', 'make' => 'Mitsubishi'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/recalls/models.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/recalls/recallsByVehicle').
      with(query: {'modelYear' => '1998', 'make' => 'Mitsubishi', 'model' => 'Galant'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/recalls/recalls.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/recalls/campaignNumber').
      with(query: {'campaignNumber' => '12V176000'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/recalls/campaign_recalls.json')).read)

  end

  def complaints_webmock

    stub_request(:get, 'https://api.nhtsa.gov/products/vehicle/modelYears').
      with(query: {'issueType' => 'c'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/complaints/years.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/products/vehicle/makes').
      with(query: {'issueType' => 'c', 'modelYear' => 1998}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/complaints/manufacturers.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/products/vehicle/models').
      with(query: {'issueType' => 'c', 'modelYear' => 1998, 'make' => 'Mitsubishi'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/complaints/models.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/complaints/complaintsByVehicle').
      with(query: {'modelYear' => 1998, 'make' => 'BMW', 'model' => '318'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/complaints/complaints.json')).read)
    
    stub_request(:get, 'https://api.nhtsa.gov/complaints/odinumber').
      with(query: {'odinumber' => 10457576}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/complaints/complaints_by_odi_number.json')).read)

  end

  # Civil Penalties

  # FakeWeb.register_uri(:get, "https://webapi.nhtsa.gov/api/CivilPenalties?format=json",
  #  :content_type => "application/json",
  #   :body => File.open(File.expand_path(".", "test/fixtures/civil_penalties/civil_penalties.json")).read
  # )

  # FakeWeb.register_uri(:get, "https://webapi.nhtsa.gov/api/CivilPenalties/2012?format=json",
  #   :content_type => "application/json",
  #   :body => File.open(File.expand_path(".", "test/fixtures/civil_penalties/civil_penalty_by_year.json")).read
  # )

  def inspection_location_webmocks

    stub_request(:get, 'https://api.nhtsa.gov/CSSIStation/state/NV').
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/child_safety_seat_inspection_station_loccator/get_by_state.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/CSSIStation/zip/63640').
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/child_safety_seat_inspection_station_loccator/get_by_zip_code.json')).read)

    stub_request(:get, 'https://api.nhtsa.gov/CSSIStation').
      with(query: {'lat' => '30.1783', 'long' => '-96.3911', 'miles' => '50'}).
      to_return(:body => File.open(File.expand_path('.', 'test/fixtures/child_safety_seat_inspection_station_loccator/get_by_geo_location.json')).read)

  end

end
