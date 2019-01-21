require_relative "questions.rb"
require "pry"

class Game
	include Question

	def initialize
		@questions = Question.new
		@right_answers = 0
		@tries = 0
		show_welcome_message
		start_game
		final_message
	end

	def start_game
		while @right_answers < @questions.questions.length
			@questions.questions.each do |question|
				if question[:answered] != true
					again = true
					while again
						@tries += 1
						answer = show_question(question[:question])
						if answer == question[:answer]
							question[:answered] = true
							@right_answers += 1
							right_answer
							again = false
						else
							next_answer = wrong_answer
							again = next_answer == 1 ? true : false
						end
					end
				end
			end
		end
	end

	private

		def show_welcome_message
			system "clear"
			puts "------ ¡Bienvenido a Trivia Ruby ------"
			puts ""
			puts "-- Reglas: "
			puts "---- 1) Cada pregunta tiene una única respuesta"
			puts "---- 2) No puede llamar a un amigo"
			puts "---- 3) No se vale buscar en San Google"
			puts ""
			puts "Presiona cualquier tecla para continuar... "
			gets.chomp
		end

		def show_question(question)
			puts
			puts "-- Pregunta: "
			puts "---- #{question}"
			print "--- Tu respuesta: "
			gets.chomp
		end

		def right_answer
			puts
			puts "** Excelente, respuesta correcta!! **"
			puts
		end

		def wrong_answer
			puts
			puts "** Respuesta incorrecta **"
			puts "----1) Reintentar"
			puts "----2) Continuar"
			print "Elegir: "
			gets.chomp
		end

		def final_message
			puts
			puts "Felicidades! has contestado correctamente todas las preguntas!"
			puts "Total de intentos: #{@tries}"
		end

end

game = Game.new