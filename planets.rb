class Planets
	attr_accessor :x, :y, :xvel, :yvel, :xscal, :yscal, :weight,:force, :name, :acceleration, :xforce, :yforce, :xacceleration, :yacceleration
	def initialize(x, y, xvel, yvel, weight, image, r)
		@image = Gosu::Image.new("images/#{image}")
		@x = x
		@y = y
 		@xscaled = @yscaled = @force = @xforce = @yforce = @xacceleration = @yacceleration = 0.0
		@name = image
		@xvel = xvel
		@yvel = yvel
		@weight = weight
		@r = r
	end
	
	def draw
		@image.draw(@xscal-@image.width/1.0, @yscal-@image.height/1.0,1)
	end

	def force(plan)
		dist = Math.sqrt(((@x - plan.x)**2) + ((@y - plan.y)**2))
    @force = ((Gravity * @weight * plan.weight) / (dist**2))

	 	@xforce -= (@force * (@x - plan.x)) / dist
    @yforce -= (@force * (@y - plan.y)) / dist
	end

	def speed
	 	@xvel = (@xvel + 15000 * @xacceleration)
		@yvel = (@yvel + 15000 * @yacceleration)
	 end

	def acceleration 
	 	 @xacceleration =  (@xforce / @weight)
	 	 @yacceleration = (@yforce / @weight)
	 	 @xforce = 0
	 	 @yforce = 0
	 end

	def location
	 	@x += @xvel * 15000
	 	@y += @yvel * 15000
	 	@xscal = (@x / (@r * 2)) + 375
		@yscal = (-@y / (@r * 2)) + 375
	end

	Gravity = 6.67408e-11
end