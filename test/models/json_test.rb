require "minitest/autorun"
require_relative "../../app/models/json"

module Models
  class JsonTest < Minitest::Test
    def setup
      @raw_json = %Q([{"key": "value"}, {"key": "value"}])
      @json = Models::Json.new(@raw_json)
    end

    def test_raw_json
      assert_equal @raw_json, @json.raw_json
    end

    def test_data
      data = [
        {
          "key" => "value"
        },
        {
          "key" => "value"
        }
      ]

      assert_equal data, @json.data
    end

    def test_unique_keys
      assert_equal ["key"], @json.unique_keys
    end
  end
end
