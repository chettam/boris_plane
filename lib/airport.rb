require_relative 'weather'

class Airport

	include Weather

	attr_accessor :capacity, :planes

	def initialize(capacity = 10)
		@planes =[]
		@capacity = capacity
	end

	def authorize(plane,action)

		land(plane) if action == :land
		
		take_off(plane) if action == :take_off
	end

	def land(plane)
		plane.land! 
		@planes << plane  unless @planes.length == capacity || current_weather == :stormy
	end

	def take_off(plane)
		unless current_weather == :stormy
			plane.take_off!
			@planes.delete(plane)
		end
	end
end