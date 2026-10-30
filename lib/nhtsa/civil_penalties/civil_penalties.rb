module Nhtsa
  module CivilPenalties

    class CivilPenalties

      def url
        "#{BASE_URI}#{END_POINT}#{DEFAULT_PARAMS}"
      end

      def civil_penalties
        # @civil_penalties ||= JSON.parse(URI.open(url).read)['Results']
        []
      end

    end

  end
end
