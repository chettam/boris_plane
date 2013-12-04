require_relative 'weather'

class Airport

	include Weather

	attr_accessor :capacity, :planes

	def initialize(capacity = 10)
		@planes =[]
		@capacity = capacity
	end

	def land(plane)
		 unless @planes.length == capacity || current_weather == :stormy
		 	plane.land! 
			@planes << plane 
		end
	end

	def take_off(plane)
		unless current_weather == :stormy
			plane.take_off!
			@planes.delete(plane)
		end
	end
end