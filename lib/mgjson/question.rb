class Question

	attr_accessor :name, :item_discrimination

	def initialize(name)

		@name = name
		@item_discrimination = 0.0
	end


	def to_s
		"Question: #{@name}. Item Discrimination Value: #{@item_discrimination.round(2)}"
	end



end
