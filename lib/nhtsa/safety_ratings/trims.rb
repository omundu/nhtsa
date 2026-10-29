module Nhtsa
  module SafetyRatings

    class Trims

      def initialize(year, manufacturer, model)
        @year = Year.new(year)
        @manufacturer = Manufacturer.new(year, manufacturer)
        @model = Model.new(year, manufacturer, model)
      end

      def url
        "#{BASE_URI}#{END_POINT}/modelyear/#{@year}/make/#{URI.encode_uri_component(@manufacturer.name)}/model/#{URI.encode_uri_component(@model.name)}#{DEFAULT_PARAMS}"
      end

      def year
        @year
      end

      def manufacturer
        @manufacturer
      end

      def model
        @model
      end

      def trims
        @trims ||= fetch_trims_data
      end

      def descriptions
        trims.map(&:trim_description)
      end

      def ids
        trims.map(&:trim_id)
      end

      def to_s
        trims.map(&:to_s).join("\n\n")
      end

      private

      def fetch_trims_data
        JSON.parse(URI.open(url).read)['Results'].collect{|trim| Trim.new(trim)}
      end

    end

  end
end
