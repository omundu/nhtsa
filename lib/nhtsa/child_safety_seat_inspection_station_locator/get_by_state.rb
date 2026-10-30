module Nhtsa
  module ChildSafetySeatInspectionStationLocator

    class GetByState

      def initialize(state_abbreviation, filters = {spanish: false, cpsweek: false})
        @state_abbreviation = state_abbreviation
        @filters = filters
      end

      def url
        if @filters[:spanish] && @filters[:cpsweek]
          "#{BASE_URI}#{END_POINT}/state/#{@state_abbreviation}#{CPS_WEEK}#{SPANISH}"
        elsif @filters[:spanish]
          "#{BASE_URI}#{END_POINT}/state/#{@state_abbreviation}#{SPANISH}"
        elsif @filters[:cpsweek]
          "#{BASE_URI}#{END_POINT}/state/#{@state_abbreviation}#{CPS_WEEK}"
        else
          "#{BASE_URI}#{END_POINT}/state/#{@state_abbreviation}"
        end
      end

      def inspection_stations
        @inspection_stations ||= JSON.parse(URI.open(url).read)['Results']
      end

    end

  end
end
