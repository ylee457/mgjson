class Student

	attr_accessor :student_id, :number_correct, :number_incorrect

	def initialize(student_id, number_correct, number_incorrect)

		@student_id, @number_correct, @number_incorrect = student_id, number_correct, number_incorrect
	end

end
