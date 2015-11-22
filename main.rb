require "gosu"
require_relative "planets"

class Solar < Gosu::Window

  G = 6.67408e-11
  
  attr_accessor :radius ,:G
  
  def initialize
    @window_size = 750
    super @window_size, @window_size
    @background_image = Gosu::Image.new("images/space.jpg")
    data=File.read("planets.txt")
    lines = data.split("\n")
    @number_of_planets = lines[0]
    @bigradius = lines[1].to_f
    @radius = (@bigradius/750).to_f
    @planets_data = lines[2...lines.length]
    @planets = []
    @planets_data.each {|planet| 
      planet = planet.split(" ")
      @planets.push(Planets.new(planet[0].to_f,planet[1].to_f,planet[2].to_f,planet[3].to_f,planet[4].to_f,planet[5],radius.to_f))
    }
  end

  def update
    @planets.each do |planet|
      for i in 0...@planets.length
        if @planets[i].name != planet.name
            planet.total_force(@planets[i])

          end
       end
       
      planet.acceleration
      planet.velocity
      planet.position
       
    end
  end
  
  def draw
    @background_image.draw(0,0,0)
    @planets.each do |planet|
      planet.draw
    end
  end
end

window = Solar.new
window.show
