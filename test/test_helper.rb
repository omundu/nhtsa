$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nhtsa'

require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require_relative 'fixtures/request_stubs'

class Minitest::Test
  include RequestStubs
end
