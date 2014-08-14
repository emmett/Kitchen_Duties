if sink.dishes
	if dishwasher.try(load(sink.dishes))
		sink.dishes = []
	else
		if diswasher.full?
			dishwasher.clean? ? dishwasher.empty : dishwasher.run
		end
	end
end

class Dishwasher
	def initialize
		@top_rack = []
		@bottom_rack = []
		@silverware_rack = []
		@soap_dish = []
	end
	
	def load (dishes)
		dishes.each do |dish|
			case dish
			when 'plate'
				@bottom_rack << dish
			when 'bowl'
				@bottom_rack << dish
			when 'tupperware'
				@bottom_rack << dish
			when 'cup'
				@top_rack << dish
			when 'silverware'
				@silverware_rack << dish
			else
				handwash(dish)
			end
		end
	end
	
	def empty
		dishes = @silverware_rack + @top_rack + @bottom_rack
		dishes.each do |dish|
			put_away(dish)
		end
		
		@bottom_rack = []
		@silverware_rack = []
		@bottom_rack = []
		
		@loaded = false
		@clean = false
	end
	
	def run
		@soap_dish = detergent
		normal_wash.press
		start.press

		@clean = true
	end
end

