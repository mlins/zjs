require 'json'

module Models
  class Json
    attr_reader :raw_json, :data

    def initialize(raw_json)
      @raw_json = raw_json
      @data     = JSON.parse(raw_json)
    end

    def unique_keys
      @data.map(&:keys).uniq.flatten
    end
  end
end
