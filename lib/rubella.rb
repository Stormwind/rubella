module Rubella

  class Map
    attr_reader :input
    attr_reader :output
    attr_reader :weighting

    def initialize(input_name, output_name, weighting_name)

      # set the input type
      input_by_name input_name

      # set the output type
      @output = case output_name
        # add the option to set the output later
        when nil then
        nil
        when "image" then
          self.output_image
        else
          raise NotImplementedError, "Not supported output type "+output_name+" given"
      end

      # set the weighting
      @weighting = case weighting_name
        # add the option to set the weighting later
        when nil then
          nil
        when "per_value" then
          self.weighting_per_value
        when "per_overall_load" then
          self.weighting_per_overall_load
        when "expotential" then
          self.weighting_expotential
        else
          raise NotImplementedError, "Not supported weighting type "+weighting_name+" given"
      end

    end

    # Creates a heatmap in the on construction given format. The data must be
    # in the also on construction given formate.
    #
    # @param data string The data, which should be used
    # @return binaryblob An output representation of the heatmap
    def create_from_string data
      process @input.string data
    end

    # Creates a heatmap in the on construction given format. The data must be
    # in the also on construction given formate.
    #
    # @param file_name string  
    # @return binaryblob An output representation of the heatmap
    def create_from_file file_name
      process @input.file file_name
    end

    # Processes the creation of the heatmap, after the construction of the input
    # object. So the input object is given here as parameter.
    #
    # @param inpt Input The inputed data
    # @return binaryblob An output representation of the heatmap
    def process inpt
      weight = @weighting.new 10
      outpt    = @output.new
      outpt.create weight.parse(inpt)
    end

    # Set the input type by the given name
    #
    # @param string Name of the input type in CamelCase
    def input_by_name input_name
      # Remove the input, if someone wants to do this
      @input = load_by_name "Input", input_name
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
      require "rubella/"+module_name.downcase+"/"+class_name.downcase

      # Try to get a class by the given name
      return Object.const_get("Rubella").const_get(module_name).const_get(class_name)

      # TODO raise this error, if input class is not found
      # raise NotImplementedError, "Not supported input type "+input_name+" given"
    end

    def output_image
      require "rubella/output/image"
      Output::Image
    end

    def weighting_per_value
      require "rubella/weighting/per_value"
      Weighting::PerValue
    end

    def weighting_per_overall_load
      require "rubella/weighting/per_overall_load"
      Weighting::PerOverallLoad
    end

    def weighting_expotential
      require "rubella/weighting/expotential"
      Weighting::Expotential
    end

  end
end