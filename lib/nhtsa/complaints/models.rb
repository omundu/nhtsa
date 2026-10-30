module Nhtsa
  module Complaints

    class Models

      def initialize(year, manufacturer)
        @year = year
        @manufacturer = Nhtsa.encode_uri_component(manufacturer)
      end

      def manufacturer
        @manufacturer
      end

      def url
        "#{BASE_URI}#{END_POINT}/models?modelYear=#{@year}&make=#{@manufacturer}&#{COMPLAINT_PARAM}"
      end

      def models
        @models ||= JSON.parse(URI.open(url).read)['results'].collect{ |model| model['model'] }
      end

    end

  end
end
