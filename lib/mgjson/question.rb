class Question

	attr_accessor :name, :number_correct, :number_incorrect, :item_discrimination

	def initialize(name, number_correct, number_incorrect)

		@name, @number_correct, @number_incorrect = name, number_correct, number_incorrect
		@item_discrimination = 0.0
	end

end
