$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nhtsa'

require 'minitest/autorun'
require 'minitest/pride'
require "fakeweb"

class Minitest::Test

  FakeWeb.register_uri(:get, "http://webapi.nhtsa.gov/api/SafetyRatings?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/fixtures/safety_ratings/years.json")).read
  )

  FakeWeb.register_uri(:get, "http://webapi.nhtsa.gov/api/SafetyRatings/modelyear/1998?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/fixtures/safety_ratings/manufacturers.json")).read
  )

  FakeWeb.register_uri(:get, "http://webapi.nhtsa.gov/api/SafetyRatings/modelyear/1998/make/Mitsubishi?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/fixtures/safety_ratings/models.json")).read
  )

  FakeWeb.register_uri(:get, "http://webapi.nhtsa.gov/api/SafetyRatings/modelyear/1998/make/Mitsubishi/model/Galant?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/fixtures/safety_ratings/trims.json")).read
  )

  FakeWeb.register_uri(:get, "http://webapi.nhtsa.gov/api/SafetyRatings/VehicleId/3832?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/fixtures/safety_ratings/ratings.json")).read
  )

end
