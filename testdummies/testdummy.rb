require 'RMagick'
require 'json'

include Magick

data = JSON::load(File.new('load_values.json', 'r'))

# prepare data
dummyList = Array.new()
data.each do |cores|

  # Add all loads to compute how much % is one % load
  loadSum = 0
  cores.each { |core| loadSum = loadSum + core }
  percentLoad = 100.0/loadSum

  # every 10 load percent one heatpoint
  i = 0
  dummyList << Array.new(10) do
    # get all cores in the certain percentage
    selectedCores= cores.select { |core| core >= i and core < (i+10)}
    # (go to next level here)
    i = i + 10
    # add the load of the resulting cores and multiply it with the overall value
    loadSum = 0
    selectedCores.each { |core| loadSum = loadSum + core }
    percent = loadSum*percentLoad
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

    l = (255-((cores*1.275))).round
    core.fill(Pixel.from_hsla(0, 255, l, 1).to_color)
    core.rectangle((i*15), (j*15), ((i+1)*15), ((j+1)*15))
    core.draw loadImg
    j = j + 1
  end
  i = i + 1
end

loadImg.display
# loadImg.write('loadimage.png')
