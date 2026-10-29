module Nhtsa
  module Complaints

    class ComplaintsByOdiNumber

      def initialize(odi_number)
        @odi_number = odi_number
      end

      def url
        "#{BASE_URI}#{COMPLAINT_ODI_ENDPOINT}?odinumber=#{@odi_number}"
      end

      def complaints_by_odi_number
        JSON.parse(URI.open(url).read)['results']
      end

    end

  end
end
