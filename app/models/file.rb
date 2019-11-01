module Models
  class File
    attr_reader :path, :data

    def initialize(path)
      @path = path
      @data = load_file
    end

    private

    def load_file
      ::File.read(@path)
    end
  end
end
