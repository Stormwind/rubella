module Rubella
  module Output

    # Output base class
    # The output class gets the storage within the already weighted and in
    # buckets sorted content. It creates a visual representation of the given
    # data and stores this local.
    #
    class Base
      attr_accessor :field_size
      attr_reader   :data

      # Constructor
      # Gets the field size to store it local. It's the size of one value of
      # the later created visual representation. The unit depends on the kind
      # of representation.
      #
      # @param field_size int size of one value
      # @return Rubella::Output::Base
      def initialize field_size
        @field_size = field_size
      end

      # Creates a visual representation of the data in the given storage and
      # stores this local.
      #
      # @param storage Rubella::Storage
      # @return Rubella::Output::Base
      def create storage
        raise NotImplementedError "Please override 'create' in your concrete "+
          "implementation"
      end
    end

  end
end