require "mgjson/version"
require 'json'
#require "mgjson/student"
#require "mgjson/question"


class Mgjson

	def initialize
	end
  
  def run(title)
  	puts "Hello World, #{title}"

  	puts "Current path is #{File.absolute_path('.')}"

  	begin
      file = File.read(title)
      
      data_hash = JSON.parse(file)
      
      data_hash.each do |d|
      
      	puts "id is #{d["user_id"]}" 
      	puts "correct is #{d["correct"]}" 
      	puts "question is #{d["question"]}" 
      
      	puts "======================\n"
      
      end

      puts "Total records is #{data_hash.size}"

    rescue StandardError => e

    	puts "Error encountered! Error is #{e.message}"
    	exit 1
    end

  	
  end


end
