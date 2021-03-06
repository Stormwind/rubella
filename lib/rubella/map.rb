module Rubella

  # Helps to process and create the heatmap
  #
  class Map
    attr_reader :input
    attr_reader :output
    attr_reader :weighting

    # Constructor
    #
    # @param input_name string Name of the input type in CamelCase
    # @param output_name string Name of the output type in CamelCase
    # @param weighting_name string Name of the weighting type in CamelCase
    # @return Rubella::Map
    # @raise NotImplementedError
    def initialize(input_name, output_name, weighting_name)

      # set the input type
      input_by_name input_name

      # set the output type
      output_by_name output_name

      # set the weighting
      weighting_by_name weighting_name

    end

    # Set the input type by the given name
    #
    # @param input_name string Name of the input type in CamelCase
    # @raise NotImplementedError
    def input_by_name input_name
      @input = load_by_name "Input", input_name
    end

    # Set the output type by the given name
    #
    # @param output_name string Name of the output type in CamelCase
    # @raise NotImplementedError
    def output_by_name output_name
      @output = load_by_name "Output", output_name
    end

    # Set the weighting type by the given name
    #
    # @param weighting_name string Name of the weighting type in CamelCase
    # @raise NotImplementedError
    def weighting_by_name weighting_name
      @weighting = load_by_name "Weighting", weighting_name
    end

    # Loads and returns the given class
    #
    # @param module_name string The Name of the module in CamelCase
    # @param class_name string The Name of the class in CamelCase
    # @return Class
    # @raise NotImplementedError
    def load_by_name module_name, class_name
      # Remove the class, if someone wants to do this
      if class_name == nil or class_name == ""
        return nil
      end

      # Try to load the given class
      require "rubella/"+underscore(module_name)+"/"+underscore(class_name)

      # Try to get a class by the given name
      return Object.const_get("Rubella").const_get(module_name).const_get(class_name)

      # TODO raise this error, if class is not found
      # raise NotImplementedError, "Not supported input type "+input_name+" given"
    end

    # Converts CamelCase words into snake_case
    #
    # @param camel_cased_word string Word in CamelCase
    # @return string
    def underscore(camel_cased_word)
      camel_cased_word.to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").downcase
    end

  end
end
