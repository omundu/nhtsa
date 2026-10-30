require 'test_helper'

class ModelsTest < Minitest::Test

  def setup
    recalls_webmocks
  end

  def test_it_builds_url_as_expected
    expected_url = 'https://api.nhtsa.gov/products/vehicle/models?modelYear=1991&make=Mitsubishi&issueType=r'

    assert_equal expected_url, Nhtsa::Recalls::Models.new(1991, 'Mitsubishi').url
  end

  def test_manufacturer_returns_the_same_string_when_appropriate
    assert_equal 'Mitsubishi', Nhtsa::Recalls::Models.new(1991, 'Mitsubishi').manufacturer
  end

  def test_manufacturer_returns_a_properly_escaped_double_barrel_name
    assert_equal 'Haley-Davidson', Nhtsa::Recalls::Models.new(1991, 'Haley-Davidson').manufacturer
  end

  def test_manufacturer_returns_a_properly_escaped_two_name
    assert_equal 'Land%20Rover', Nhtsa::Recalls::Models.new(1991, 'Land Rover').manufacturer
  end

  def test_manufacturer_returns_a_properly_escaped_multiple_mixed_format_name
    assert_equal 'Thomas-Built%20Buses', Nhtsa::Recalls::Models.new(1991, 'Thomas-Built Buses').manufacturer
  end

  def test_manufacturer_returns_a_properly_escaped_multiple_name
    assert_equal 'King%20Of%20The%20Road', Nhtsa::Recalls::Models.new(1991, 'King Of The Road').manufacturer
  end

  def test_models_returns_an_array_of_models
    model_names = ['GALANT', 'ECLIPSE', 'MONTERO', 'SPYDER', '3000GT', 'DIAMANTE', 'MIRAGE', 'MONTERO SPORT']

    assert_equal model_names, Nhtsa::Recalls::Models.new(1998, 'Mitsubishi').models
  end

end
