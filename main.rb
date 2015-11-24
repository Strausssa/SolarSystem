require "gosu"
require_relative "planets"

class Solar < Gosu::Window
  
  attr_accessor :r ,:Gravity
  
  def initialize 
    #window
    @window_size = 750
    super @window_size, @window_size
    @background_image = Gosu::Image.new("images/space.jpg")
    data=File.read("planets.txt")
    lines = data.split("\n")

    #r/# of planets
    @number_of_planets = lines[0]
    @bigr = lines[1].to_f
    @r = (@bigr/750).to_f
    
    #planet_data stuff
    @planets_data = lines[2...lines.length]
    @planets = []
    @planets_data.each {|planet| 
      planet = planet.split(" ")
      @planets.push(Planets.new(planet[0].to_f,planet[1].to_f,planet[2].to_f,planet[3].to_f,planet[4].to_f,planet[5],r.to_f))
    }
  end

  def update
        @planets.each do |planet|
            for i in 0...@planets.length
                planet.force(@planets[i]) if @planets[i].name != planet.name
            end
      #Gets From Planet.rb
      planet.acceleration
      planet.speed
      planet.location
    end
  end
  
  def draw
    @background_image.draw(0, 0, 0)
    @planets.each(&:draw)
  end

  Gravity = 6.67408e-11
end

window = Solar.new
window.show