# http://webapi.nhtsa.gov/api/Recalls/vehicle?format=json

module Nhtsa
  module Recalls

    class Years
      def url
        "http://webapi.nhtsa.gov/api/Recalls/vehicle?format=json"
      end

      def years
        JSON.parse(open(url).read)["Results"].collect{|year| year["ModelYear"]}
      end
    end

    class Manufacturers
      def initialize(year)
        @year = year
      end

      def url
        "http://webapi.nhtsa.gov/api/Recalls/vehicle/modelyear/#{@year}?format=json"
      end

      def manufacturers
        JSON.parse(open(url).read)["Results"].collect{|manufacturer| manufacturer["Make"]}
      end
    end

    class Models
      def initialize(year, manufacturer)
        @year = year
        @manufacturer = URI::encode(manufacturer)
      end

      def url
        "http://webapi.nhtsa.gov/api/Recalls/vehicle/modelyear/#{@year}/make/#{@manufacturer}?format=json"
      end

      def models
        JSON.parse(open(url).read)["Results"].collect{|model| model["Model"]}
      end
    end

    class Recalls
      def initialize(year, manufacturer, model)
        @year = year
        @manufacturer = URI::encode(manufacturer)
        @model = URI::encode(model)
      end

      def url
        "http://webapi.nhtsa.gov/api/Recalls/vehicle/modelyear/#{@year}/make/#{@manufacturer}/model/#{@model}?format=json"
      end

      def recalls
        JSON.parse(open(url).read)["Results"]
      end
    end

    class CampaignRecalls
      def initialize(campaign_number)
        @campaign_number = campaign_number
      end

      def url
        "http://webapi.nhtsa.gov/api/Recalls/vehicle/CampaignNumber/#{@campaign_number}?format=json"
      end

      def campaign_recalls
        JSON.parse(open(url).read)["Results"]
      end
    end

  end
end
