require 'json'

module Rubella
  module Input

    #
    #
    class JSON

      attr_reader :data

      def initialize(json_string)
        data = ::JSON::load(json_string)
      end

      def self.string(json_string)
        self.new(json_string)
      end

      def self.file(json_file)
        self.new File.new(json_file, 'r')
      end

      # private :new

    end

  end
end