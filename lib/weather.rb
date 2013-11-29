require 'prime'

module Weather

	def current_weather
		change_wheather
	end

	def change_wheather
		rand(100).prime? ? :stormy : :sunny
	end

end