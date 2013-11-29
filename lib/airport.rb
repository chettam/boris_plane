class Airport

	attr_accessor :capacity

	def initialize(capacity = 10)
		@capacity = capacity
	end

	def authorize(plane,action)

		land(plane) if action == :land
		take_off(plane) if action == :take_off
	end

	def land(plane)
		raise "the airport is full" if capacity ==0
		plane.land! 
		@capacity -= 1
	end

	def take_off(plane)
		plane.take_off!
		@capacity += 1
	end
end