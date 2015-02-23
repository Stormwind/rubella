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

  end

end