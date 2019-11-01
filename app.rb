$LOAD_PATH.unshift File.expand_path('.', 'app')

require 'cli/ui'
require 'awesome_print'

require "models/file"
require "models/json"

class App
  attr_reader :json

  def initialize(path)
    CLI::UI::StdoutRouter.enable

    @path         = path
    @json         = Models::Json.new(Models::File.new(path).data)

    render
  end

  private

  def render
    CLI::UI::Frame.open(@path) do
      render_main_menu
    end
  end

  def render_main_menu
    puts "Main Menu"
    CLI::UI::Prompt.ask('What would you like to do?') do |handler|
      handler.option('Search')      { render_search_fields }
      handler.option('View Fields') { render_fields }
      handler.option('Quit')        { puts "Goodbye!" }
    end
  end

  def render_fields
    CLI::UI::Frame.open("Fields") do
      puts @json.unique_keys.join("\n")
    end
    render_main_menu
  end

  def render_search_fields
    CLI::UI::Prompt.ask('Which field would you like to search?') do |handler|
      @json.unique_keys.each do |key|
        handler.option(key) { |selection| render_search_value(key) }
      end
    end
  end

  def render_search_value(key)
    value = CLI::UI::Prompt.ask("Please enter a search value for the #{key} field:")
    results = @json.search(key, value)
    if results.size == 0
      puts "No results found!"
      render_main_menu
    else
      render_search_result(key, value, results, 0)
    end
  end

  def render_search_result(key, value, results, index)
    CLI::UI::Frame.open("Result #{index + 1} of #{results.size} for #{value} on #{key}") do
      ap results[index]
    end

    CLI::UI::Prompt.ask('What would you like to do?') do |handler|
      unless (index + 1) == results.size
        handler.option('Go to Next Result')     { render_search_result(key, value, results, index + 1)}
      end
      unless index == 0
        handler.option('Go to Previous Result') { render_search_result(key, value, results, index - 1)}
      end
      handler.option('Go to Main Menu')       { render_main_menu }
    end
  end
end
