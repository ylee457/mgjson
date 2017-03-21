class Student

	attr_accessor :student_id, :questions

	def initialize(student_id, if_correct, question)

		@student_id = student_id
		@questions = {question => if_correct}
	end


	def to_s
		"id: #{@student_id}. percent_correct: #{get_percent_correct}"
	end


	

	def get_percent_correct

	  percent_correct = 0
	  number_of_corrects_size = 0 

		questions_size = self.questions.size

		# get all the answers
		question_values = self.questions.values

    # select only the correct answer
    number_of_corrects =[]
		number_of_corrects =  question_values.select {|v| v == true}  if question_values.size > 0

		number_of_corrects_size = number_of_corrects.size
		percent_correct = number_of_corrects_size.to_f / questions_size if questions_size > 0

		#puts "Total questions answered: #{questions_size}. Total correct: #{number_of_corrects_size}."

    # round percentage to 2 decimal places
		return percent_correct.round(2)

	end

end
