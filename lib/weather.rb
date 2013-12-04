require 'prime'

module Weather

	def current_weather
		rand(100).prime? ? :stormy : :sunny
	end
end