module Nhtsa
  module ChildSafetySeatInspectionStationLocator

    class GetByGeoLocation

      def initialize(latitude, longitude, radius, filters = {spanish: false, cpsweek: false})
        @latitude = latitude
        @longitude = longitude
        @radius = radius
        @filters = filters
      end

      def url
        if @filters[:spanish] && @filters[:cpsweek]
          "#{BASE_URI}#{END_POINT}?lat=#{@latitude}&long=#{@longitude}&miles=#{@radius}#{CPS_WEEK}#{SPANISH}"
        elsif @filters[:spanish]
          "#{BASE_URI}#{END_POINT}?lat=#{@latitude}&long=#{@longitude}&miles=#{@radius}#{SPANISH}"
        elsif @filters[:cpsweek]
          "#{BASE_URI}#{END_POINT}?lat=#{@latitude}&long=#{@longitude}&miles=#{@radius}#{CPS_WEEK}"
        else
          "#{BASE_URI}#{END_POINT}?lat=#{@latitude}&long=#{@longitude}&miles=#{@radius}"
        end
      end

      def inspection_stations
        @inspection_stations ||= JSON.parse(URI.open(url).read)['Results']
      end

    end

  end
end
