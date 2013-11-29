require 'prime'

module Weather

	def current
		change_wheather
	end

	def change_wheather
		rand(7).prime? ? :stormy : :sunny
	end

end