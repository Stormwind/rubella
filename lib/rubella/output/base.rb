module Rubella
  module Output

    class Base
      attr_accessor :field_size
      attr_reader   :data

      def initialize field_size = 15
        @field_size = field_size
      end
    end

  end
end