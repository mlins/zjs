require "minitest/autorun"
require_relative "../../app/models/file"

module Models
  class FileTest < Minitest::Test
    def setup
      @file = Models::File.new(::File.join(::File.dirname(__FILE__), "..", "fixtures", "test.json"))
    end

    def test_file_data
      data = %Q([{"key": "value"},{"key": "value"}]\n)
      assert_equal data, @file.data
    end
  end
end
