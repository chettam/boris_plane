class Airport

	def authorize(plane,action)
		plane.land! if action == :land
		plane.take_off! if action == :take_off
	end
end