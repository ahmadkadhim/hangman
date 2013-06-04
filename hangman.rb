class Hangman

	attr_accessor :words, :word, :chances, :letter, :board, :previous_letters

	WORDS = ["orange", "graph", "easy", "logical", "eerie", "feelers", "starfish"]

	def initialize
		@chances = 8
		@previous_letters = []
		@word = "orange"
		@board = draw_board(word)
	end

	def guesses
		p "You have already guessed #{previous_letters}"
	end

	def draw_board(word)
		board = ""
		print "\n"
		for i in word.each_char
			board << "_ "
		end
		print "\n\n"
		board
	end

	def word_has(letter)
		word.include?(letter)
	end

	def put_letter_on_board(letter)
		board = draw_board(word)
		counter = 0
		word.each_char do |x|
			if letter == x
				board.insert(counter, letter + " ")
			end
			counter += 2
		end
		p board
	end

	def wrong_letter(letter)

		@previous_letters.push(letter)

		if word_has(letter)
			put_letter_on_board(letter)
		else
			@chances -= 1
			p "Wrong Guess!"
		end
	end

	def your_guess
		print "\n"
		print "What's your guess? "
		@letter = gets.chomp
	end

	def play_game
		until chances == 0 || !board.include?("_")
			your_guess		
			wrong_letter(letter)
		end
	end

end

h = Hangman.new

h.play_game

