module Nhtsa
  module SafetyRatings

    class Models

      def initialize(year, manufacturer)
        @year = Year.new(year)
        @manufacturer = Manufacturer.new(year, manufacturer)
      end

      def url
        "#{BASE_URI}#{END_POINT}/modelyear/#{@year}/make/#{Nhtsa.encode_uri_component(@manufacturer.name)}#{DEFAULT_PARAMS}"
      end

      def models
        @models ||= fetch_models_data
      end

      def model_names
        models.map(&:model_name)
      end

      def to_s
        models.join('\n')
      end

      private

      def fetch_models_data
        JSON.parse(URI.open(url).read)['Results'].collect{|model| Model.new(@year, @manufacturer, model['Model'])}
      end

    end

  end
end
