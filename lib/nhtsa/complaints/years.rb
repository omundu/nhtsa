module Nhtsa
  module Complaints

    class Years

      def url
        "#{BASE_URI}#{END_POINT}/modelYears?#{COMPLAINT_PARAM}"
      end

      def years
        @years ||= JSON.parse(URI.open(url).read)['results'].collect{|year| year['modelYear']}
      end

    end

  end
end
