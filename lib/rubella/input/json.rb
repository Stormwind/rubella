require 'rubella/input/base'
require 'json'

module Rubella
  module Input

    # Gets data in JSON formate and translate it into a Ruby readable form to
    # make it possible to handle the data.
    #
    class JSON < Base

      # Constructor
      # This constructer can create a new Rubella::Input::JSON object, but it
      # is supposed to be private. Please use Rubella::Input::JSON.string or
      # Rubella::Input::JSON.file to create a new instance.
      #
      # @param json_string string A string, which contains the data as json
      # @return Rubella::Input::JSON
      #
      def initialize json_string
        @data = ::JSON::load json_string
      end

      # Constructor
      # Creates a new Rubella::Input::JSON object, from the given json.
      #
      # @param json_string string A string, which contains the data as json
      # @return Rubella::Input::JSON
      def self.string json_string
        self.new json_string
      end

      # Constructor
      # Creates a new Rubella::Input::JSON object, from the given file.
      # Only the file name is required.
      #
      # @param json_file string The name of the file, which json contains
      # @return Rubella:Input::JSON
      #
      def self.file json_file
        self.new File.new json_file, 'r'
      end

    end

  end
end