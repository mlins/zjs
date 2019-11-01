require "minitest/autorun"
require_relative "../../app/models/json"

class JsonTest < Minitest::Test
  def setup
    @json = Models::Json.new(%Q([{"key": "value"}, {"key": "value"}]))
  end

  def test_unique_keys
    assert_equal ["key"], @json.unique_keys
  end
end
