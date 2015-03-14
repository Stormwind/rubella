module Rubella

  # The Rubella::Storage holds the weighted data.
  # Storages can be added to get a timeline. But the Storage has no concrete
  # knowledge of time.
  # The Storage can have a defined length. If new data is added, it will drop
  # the oldest entries.
  #
  class Storage
    attr_reader :data
    attr_reader :length

    def initialize data, length = nil
      @data = data
      self.length = length
    end

    # Defines the length of the Storage.
    # Be careful, if your Storage has more entries, tha the new length, the
    # oldest entries will immediately be dropped.
    #
    def length= length
      @length = length

      # TODO drop entries, if more than new length
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

  end

end
