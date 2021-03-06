module Nhtsa
  module Recalls
    class CampaignRecalls
      def initialize(campaign_number)
        @campaign_number = campaign_number
      end

      def url
        "#{BASE_URI}#{END_POINT}/CampaignNumber/#{@campaign_number}#{DEFAULT_PARAMS}"
      end

      def campaign_recalls
        JSON.parse(open(url).read)["Results"]
      end
    end
  end
end
