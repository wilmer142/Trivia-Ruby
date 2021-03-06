require_relative "errors.rb"
require "pry"

module Question

	class Question

		include Errors

		attr_accessor :questions

		def initialize
			@questions = Array.new
			load_questions('questions.txt')
		end

		private 

			def load_questions(filename)
				if File.file?(filename)
					File.open(filename).each do |line|
						if line.include? "(Definicion)"
							if line.include? "\n" 
								line.chomp!.slice! " (Definicion)" 
							end 
							line.slice! " (Definicion)"
							question = {question: line, answer: "", answered: false }
							@questions.push(question)
						elsif line.include? "(Respuesta)"
							if line.include? "\n" 
								line.chomp!.slice! " (Respuesta)" 
							end 
							line.slice! " (Respuesta)"
							@questions[-1][:answer] = line.strip
						end
					end
				else
					raise FileNotFoundError.new("File does not exist")
				end
			end

	end
end

#question = Question::Question.new
#puts question.questions
