require_relative "questions.rb"
require "pry"

module Game

	include Question

	class Game

		def initialize
			@questions = Question.new
			@right_answers = 0
			show_welcome_message
			start_game
		end

		def start_game
			while @right_answers < @questions.questions.length
				@questions.questions.each do |question|
					
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
				print "Presiona cualquier tecla para continuar... "
			end

	end

end