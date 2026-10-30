module Nhtsa
  module Recalls

    class Manufacturers

      def initialize(year)
        @year = year
      end

      def url
        "#{BASE_URI}#{END_POINT}/makes?modelYear=#{@year}&#{RECALL_PARAM}"
      end

      def manufacturers
        @manufacturers ||= JSON.parse(URI.open(url).read)['results'].collect{ |manufacturer| manufacturer['make'] }
      end

    end

  end
end
