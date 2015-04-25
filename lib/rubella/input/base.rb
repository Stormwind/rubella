module Rubella
  module Input

    # Gets the rwa data and translate it into a by the Rubella::Weighting::Base
    # class readable format.
    # This must be an array within subarrays, which have all the same lenght
    # and contains only numeric data.
    #
    # TODO The validation of the data should happen here
    # Check if data is array, with subarrays. Check, that all sub array have
    # the same size. Check that all the content are numeric values between 0
    # and 100.
    #
    class Base
      attr_reader :data

      # Constructor
      # Creates a new Rubella::Input::Base object, from the given data.
      #
      # @param value string A string, which contains the data
      # @return Rubella::Input::Base
      #
      def self.string value
        raise NotImplementedError.new "Please override 'self.string' in your "+
          "concrete implementation"
      end

      # Constructor
      # Creates a new Rubella::Input::Base object, from the given file.
      # Only the file name is required.
      #
      # @param file_name string The name of the file
      # @return Rubella:Input::Base
      #
      def self.file file_name
        raise NotImplementedError.new "Please override 'self.file' in your "+
          "concrete implementation"
      end

      def each &block
        @data.each &block
      end

    end

  end
end
