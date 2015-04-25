module Rubella
  module Output

    # Output base class
    # The output class gets the storage within the already weighted and in
    # buckets sorted content. It creates a visual representation of the given
    # data and stores this local.
    #
    class Base
      attr_accessor :field_size

      # Constructor
      # Gets the field size to store it local. It's the size of one value of
      # the later created visual representation. The unit depends on the kind
      # of representation.
      #
      # @param data Rubella::Storage
      # @param field_size int size of one value
      # @return Rubella::Output::Base
      #
      def initialize data, field_size
        @data       = data
        @field_size = field_size
      end

      # Creates a visual representation.
      #
      # @return rendered data
      #
      def render
        raise NotImplementedError "Please override 'render' in your concrete "+
          "implementation"
      end
    end

  end
end
