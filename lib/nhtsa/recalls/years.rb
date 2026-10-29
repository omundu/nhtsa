module Nhtsa
  module Recalls

    class Years
      
      def url
        "#{BASE_URI}#{END_POINT}/modelYears#{RECALL_PARAM}"
      end

      def years
        @years ||= JSON.parse(URI.open(url).read)['Results'].collect{|year| year['ModelYear']}
      end

    end

  end
end
