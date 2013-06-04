class Hangman

	attr_accessor :chosen_word, :chances, :guessed_letter, :words
	WORDS = ["orange", "graph", "easy", "logical", "eerie", "feelers", "starfish"]


	def initialize
		@chances = 8
		@chosen_word = WORDS.sample
		# words[rand(words.length)]
	end

	def game_start
		print "\n"
		@chosen_word.each_char do |var|
			print "_ "
		end
		print "\n"
	end

	def guess
		p "#{chances} guesses left"
		print "\n"

		p "guess a letter"
		guessed_letter = gets.chomp
		p guessed_letter

		if chosen_word.include?(guessed_letter)
			for i in chosen_word.each_char
				if guessed_letter == i
					print guessed_letter + " "
				else
					print "_ "
				end
			end
		else
			print "no matches"
			game_start
		end
		@chances -= 1
	end

	def play_game
		game_start
		if chances >= 0
			guess
		end
	end


end

h = Hangman.new
p h
h.play_game