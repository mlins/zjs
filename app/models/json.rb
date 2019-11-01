require 'json'

module Models
  class Json
    attr_reader :raw_json, :data

    def initialize(raw_json)
      @raw_json = raw_json
      @data     = JSON.parse(raw_json)
    end

    def unique_keys
      @data.map(&:keys).flatten.uniq
    end

    def search(key, value)
      @data.select do |object|
        object[key] == value
      end
    end
  end
end
