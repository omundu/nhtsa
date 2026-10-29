module Nhtsa
  module Recalls

    class CampaignRecalls

      def initialize(campaign_number)
        @campaign_number = campaign_number
      end

      def url
        "#{BASE_URI}#{CAMPAIGN_RECALL_ENDPOINT}?campaignNumber=#{@campaign_number}"
      end

      def campaign_recalls
        JSON.parse(URI.open(url).read)['results']
      end

    end

  end
end
