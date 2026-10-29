module Nhtsa
  module SafetyRatings

    class Manufacturers

      def initialize(year)
        @year = Year.new(year)
      end

      def url
        "#{BASE_URI}#{END_POINT}/modelyear/#{@year}#{DEFAULT_PARAMS}"
      end

      def manufacturers
        @manufacturers ||= fetch_manufacturers_data
      end

      def year
        @year
      end

      def values
        manufacturers.map(&:name)
      end

      def to_s
        manufacturers.map(&:to_s)
      end

      private

      def fetch_manufacturers_data
        JSON.parse(URI.open(url).read)['Results'].collect{|manufacturer| Manufacturer.new(@year, manufacturer['Make'])}
      end

    end

  end
end
