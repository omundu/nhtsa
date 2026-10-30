require 'test_helper'

module Complaints

  class YearsTest < Minitest::Test

    def setup
      complaints_webmocks
    end

    def test_it_builds_url_as_expected
      expected_url = 'https://api.nhtsa.gov/products/vehicle/modelYears?issueType=c'

      assert_equal expected_url, Nhtsa::Complaints::Years.new.url
    end

    def test_years_returns_an_array_of_years
      years_array = ['1949', '1955', '1957', '1958', '1959', '1960', '1961', '1962', '1963', '1964', '1965', '1966', '1967', '1968', '1969', '1970', '1971', '1972', '1973', '1974']

      assert_equal years_array, Nhtsa::Complaints::Years.new.years
    end

  end

end
