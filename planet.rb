require "gosu"

class Planet

	def initialize points, system_size, window_size
		@image = Gosu::Image.new("images/#{points[5]}")
		@system_size = system_size
		@xpos = points[0].to_f/@system_size*window_size + window_size/2
		@ypos = points[1].to_f/@system_size*window_size + window_size/2
		#@xvel = points[2].to_f
		#@yvel = points[3].to_f
		#@mass = points[4].to_f
	end

	def draw 
		@image.draw(@xpos,@ypos,1)
	end

	def move 
		
	end

end