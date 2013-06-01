require 'RMagick'

include Magick

# Create a dummy list including 300 cores, with a load between 0 and 100
numberGenerator = Random.new()

# heatmap over 5 minutes by one measure per 5 sec
dummyList = Array.new(60) do
  # 16 dummy cores
  # lets say 10 cores have a load up to 10%
  # 4 have a load up to 30%
  # and 2 have a load up to 100%
  j = 0
  cores = Array.new(16) do
    j = j + 1
    case
      when j <= 10
        numberGenerator.rand(10)
      when (j >= 11 and j <= 14)
        numberGenerator.rand(30)
      when (j >= 15 and j <= 16)
        numberGenerator.rand(100)
    end
  end

  # every 10 load percent one heatpoint
  i = 0
  Array.new(10) do
    amount = cores.select { |core| core >= i and core < (i+10)}.length
    i = i + 10
    amount
  end
end

# puts dummyList.inspect

# start drawing the damn thing
loadImg = Image.new(900,150) { self.background_color = "white" }

i = 0
dummyList.each do |point|
  j = 0
  k = 10
  point.reverse.each do |cores|
    # draw a red rectangle on the white background
    core = Draw.new

    weightedCores = 0
    weightedCores = k**0.8*cores*7.96875 if cores != 0
    weightedCores = 127.5 if weightedCores > 127.5
    l = (255-weightedCores).round
    core.fill(Pixel.from_hsla(0, 255, l, 1).to_color)
    core.rectangle((i*15), (j*15), ((i+1)*15), ((j+1)*15))
    core.draw loadImg
    j = j + 1
    k = k - 1
  end
  i = i + 1
end

loadImg.display
