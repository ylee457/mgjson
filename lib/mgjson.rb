require "mgjson/version"
require 'json'
require "mgjson/student"
require "mgjson/question"


class Mgjson

	def initialize
		@students = {}
		@questions = {}

    @group_low = []
    @group_mid = []
    @group_high = []

	end
  
  def run(title)

    begin

      process_data_file(title)
      group_students
      calculate_item_disc_for_each_question

      # retrieve all the questions
      questions = @questions.values

      # sort the questions
      questions.sort! {|a, b| a.item_discrimination <=> b.item_discrimination}

      print_questions("", questions)


    rescue StandardError => e
  
      puts "Error encountered! Error is #{e.message}"
      exit 1
    end

  	

  	
  end



  private

    def process_data_file(file_name)

     
      file = File.read(file_name)
      
      data_hash = JSON.parse(file)

      data_hash.each do |d|

        student_id = d["user_id"]
        if_correct = d["correct"]
        question = d["question"]

        student = nil

        #store data info into a student and question hash
        if @students.has_key?(student_id)

          student = @students[student_id]

          # store the question into the student's questions
          student.questions.store(question, if_correct)

        else
          student = Student.new(student_id, if_correct, question)

          @students.store(student_id, student)

        end

        # store data info into a student and question hash
        if @questions.has_key?(question)

          a_question = @questions[question]
        
        else
          a_question = Question.new(question)

          @questions.store(question, a_question)

        end
      
      end

      # print to console - demostration code
      #students = @students.values
      #print_students("Student info #", students)

    end


    # print all the students's percent_correct
    def print_students(label, students)
      
      students.each do |s|
      
       puts "#{label} #{s}"
       puts "\n\n"
      end

    end


    def print_questions(label, questions)
      
      questions.each do |q|
        puts "#{label} #{q}"
        puts "\n\n"
      end

    end


    # divide all students into 3 equal-size group based on the percentage correct of their questions
    def group_students


      # retrieve the student
      students = @students.values
      students.sort! { |a,b| a.get_percent_correct <=> b.get_percent_correct }

      students_size = students.size 
      n = students_size / 3


      @group_low = divide_students_to_group(0, n-1, students)
      @group_mid = divide_students_to_group(n, n*2-1, students)
      @group_high = divide_students_to_group(n*2, students_size-1, students)


    end

    def divide_students_to_group(begin_index, end_index, students)

      group = []

      for i in begin_index..end_index

        group << students[i]

      end

      return group
      
    end


    # calculate the item discrimination number for each question
    def calculate_item_disc_for_each_question

      # retrieve all the questions
      questions = @questions.values

      questions.each do |q|

        # get the percent correct from top cohort
        a = get_percent_correct_from_group_for_question(@group_high, q)

        # get the percent correct from bottom cohort
        b = get_percent_correct_from_group_for_question(@group_low, q) 

        item_disc = a - b

        q.item_discrimination = item_disc

      end
      
    end


    def get_percent_correct_from_group_for_question(group, q)

      total_answered = 0
      num_correct = 0
      percent_correct = 0

      # loop through the group and get each student
      group.each do |s|

        # determine if this question was answered by the student
        if s.questions.has_key?(q.name)

          # this question was answered by the student, so increment the counter
          total_answered = total_answered + 1

          value = s.questions[q.name]

          # the student answered the question right, so increment the counter
          num_correct = num_correct + 1 if value

        end
        
      end

      percent_correct = num_correct.to_f / total_answered if total_answered > 0

      # round to 1 decimal place
      return percent_correct.round(1)
      
    end


end
