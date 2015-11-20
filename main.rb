require "gosu"
require_relative "sun"
require_relative "planet"

class SolarSystemWindow < Gosu::Window

  G = 6.67408e-11 

  def initialize plan
    @background_image = Gosu::Image.new("images/space.jpg")
    @window_size = 750
    super @window_size, @window_size
    @data = File.read("#{plan}")
    @lines = @data.split("\n")
    @planets = []
    @planets_data = @lines[2..6].map {|planet| planet.split(" ") }
    @planets_data.each { |planet| @planets.push(Planet.new(planet, @lines[1].to_f*2, @window_size)) }
  end

  def update

  end

  def button_down id
    close if id == Gosu::KbEscape
  end

  def draw
    @background_image.draw(0,0,0)
    @planets.each { |planet| planet.draw }
  end

end

window = SolarSystemWindow.new("simulations/planets.txt")
window.show