module Rubella

  # The Rubella::Storage holds the weighted data.
  # Storages can be added to get a timeline. But the Storage has no concrete
  # knowledge of time.
  # The Storage can have a defined length. If new data is added, it will drop
  # the oldest entries.
  #
  class Storage
    attr_reader :data
    # :length

    def initialize data, length = 0
      @data       = data
      self.length = length
    end

    # Defines the length of the Storage.
    #
    # Be careful, if your Storage has more entries, tha the new length, the
    # oldest entries will immediately be dropped. If your Storage has less
    # entries, it will be filled up with empty entries.
    # Happens only if data has entries.
    #
    # Setting the length to 0 will disable this feature
    #
    # TODO fill up with 0 values, if data is not multidemensional
    #
    # @param length Integer The size of the storage
    # @return Integer The new size
    #
    def length= length
      @length = length

      # Use length only, if length is valid
      if @length != 0 and self.length != 0
        # Drop entries, if more than new length
        while self.length > @length
          @data.pop
        end
        # Prefill with empty content, if less than new length
        dummy_data = Array.new(self.dataset_length, 0)
        while self.length < @length
          @data.unshift dummy_data
        end
      end
      
      @length
    end

    # Returns the current length of the storage.
    # (How many datasets it holds.)
    #
    # @return Integer length
    #
    def length
      @data.length
    end

    # Returns the length of a dataset.
    # Will return 0, if no datasets in storage.
    #
    # TODO Throw an error, if data has different lengths
    #
    # @return Integer length of one dataset
    #
    def dataset_length
      return 0 if self.length == 0
      return 1 unless @data[0].respond_to? "length"

      @data[0].length
    end

    # Adds the data from the given storage to the own data and return this as a
    # new Storage. Does not modify one of the storages. 
    # 
    # @param storage Rubella::Storage Storage with new data
    # @return Rubella::Storage
    #
    def add storage
      Storage.new (storage.data+@data), @length
    end

    # Passes each dataset through the given block.
    #
    # @param pointer to block
    #
    def each &block
      @data.each &block
    end

  end

end
