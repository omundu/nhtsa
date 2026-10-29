module Nhtsa
  module SafetyRatings

    class Ratings

      def initialize(*vehicle_ids)
        raise ArgumentError, 'At Least 1 vehicle id is required' if vehicle_ids.empty?

        @vehicle_ids = Array(vehicle_ids).flatten
      end

      def urls
        @vehicle_ids.map{ |vehicle_id| url(vehicle_id) }
      end

      def url(vehicle_id)
        "#{BASE_URI}#{END_POINT}/VehicleId/#{vehicle_id}#{DEFAULT_PARAMS}"
      end

      def ratings
        @ratings ||= fetch_ratings_data
      end

      def values
        ratings.map(&:values)
      end

      def to_s
        ratings.map(&:to_s).join("\n#{'='*50}\n\n")
      end

      private

      def fetch_ratings_data
        @vehicle_ids.inject([]) { |ratings_data, vehicle_id| ratings_data << Rating.new(JSON.parse(URI.open(url(vehicle_id)).read)['Results'].first) }
      end

    end

  end
end
