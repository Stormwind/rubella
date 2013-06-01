require 'RMagick'
require 'json'

include Magick

data = JSON::load(File.new('load_values.json', 'r'))
weigthOfOneCore = 127.5/data[0].length

# prepare data
dummyList = Array.new()

data.each do |cores|
  # every 10 load percent one heatpoint
  i = 0
  dummyList << Array.new(10) do
    amount = cores.select { |core| core >= i and core < (i+10)}.length
    i = i + 10
    amount
  end
end

# puts dummyList.inspect

# image size
x = dummyList.length*15

# start drawing the damn thing
loadImg = Image.new(x,150) { self.background_color = "white" }

i = 0
dummyList.each do |point|
  j = 0
  point.reverse.each do |cores|
    # draw a red rectangle on the white background
    core = Draw.new

    weightedCores = cores*weigthOfOneCore
    weightedCores = 127.5 if weightedCores > 127.5
    l = (255-weightedCores).round
    core.fill(Pixel.from_hsla(0, 255, l, 1).to_color)
    core.rectangle((i*15), (j*15), ((i+1)*15), ((j+1)*15))
    core.draw loadImg
    j = j + 1
  end
  i = i + 1
end

loadImg.display
# loadImg.write('loadimage3.png')
