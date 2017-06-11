require 'test_helper'

class YearsTest < Minitest::Test

  def test_it_builds_url_as_expected
    expected_url = "https://webapi.nhtsa.gov/api/Recalls/vehicle?format=json"

    assert_equal expected_url, Nhtsa::Recalls::Years.new.url
  end

  def test_years_returns_an_array_of_years
    years = ["9999", "2017", "2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001", "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993", "1992", "1991", "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983", "1982", "1981", "1980", "1979", "1978", "1977", "1976", "1975", "1974", "1973", "1972", "1971", "1970", "1969", "1968", "1967", "1966", "1965", "1964", "1963", "1962", "1961", "1960", "1959", "1958", "1957", "1956", "1955", "1954", "1953", "1952", "1951", "1950", "1949"]

    assert_equal years, Nhtsa::Recalls::Years.new.years
  end

end
