module Nhtsa
  module SafetyRatings

    class Years

      def url
        "#{BASE_URI}#{END_POINT}#{DEFAULT_PARAMS}"
      end

      def years
        @years ||= fetch_years_data
      end

      def values
        years.map(&:name)
      end

      def to_s
        years.map(&:to_s)
      end

      private

      def fetch_years_data
        JSON.parse(URI.open(url).read)['Results'].collect{|year| Year.new(year['ModelYear'])}
      end

    end

  end
end
