require "nhtsa/version"
require 'nhtsa/safety_ratings'
require "nhtsa/recalls"
require "nhtsa/complaints"
require "nhtsa/civil_penalties"
require "nhtsa/child_safety_seat_inspection_station_locator"
require 'open-uri'
require 'json'

module Nhtsa

  BASE_URI = 'https://api.nhtsa.gov'
  DEFAULT_PARAMS = '?format=json'

  def self.encode_uri_component(str, enc = nil)
    URI.encode_www_form_component(str, enc).gsub("+", "%20")
  end
  
end
