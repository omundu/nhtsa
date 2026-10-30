module Nhtsa
  module Recalls

    class Recalls

      def initialize(year, manufacturer, model)
        @year = year
        @manufacturer = URI.encode_uri_component(manufacturer)
        @model = URI.encode_uri_component(model)
      end

      def manufacturer
        @manufacturer
      end

      def model
        @model
      end

      def url
        "#{BASE_URI}#{RECALL_ENDPOINT}?modelYear=#{@year}&make=#{@manufacturer}&model=#{@model}"
      end

      def recalls
        @recalls ||= JSON.parse(URI.open(url).read)['results']
      end

    end

  end
end
