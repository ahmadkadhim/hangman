class Hangman

	attr_accessor :words, :word, :chances, :letter, :board, :previous_letters
	WORDS = ["orange", "graph", "easy", "logical", "eerie", "feelers", "starfish"]

	def initialize
		@chances = 8
		@previous_letters = []
		# random words commented out for testing purposes
		# @word = WORDS[rand(WORDS.length)]
		@word = "easy"
		@board = draw_board(word)
	end

	def draw_board(word)
	    board = ""
	    print "\n"
	    for i in word.each_char
	      board << "_ "
	    end
	    print "\n\n"
	    puts board
	    board
 	end

 	def check_valid_input?(letter)
		if letter.match(/[[:lower:]]/) && letter.length == 1
			true
		else
			false
		end
	end

	def deal_with_invalid_input(letter)
		if !check_valid_input?(@letter)
			puts "Invalid guess: singular lowercase letters only, please"
			your_guess
			deal_with_invalid_input(@letter)
		end	
	end

	def correct_letter?(letter)
		word.include?(letter) ? true : false
	end

	def put_letter_on_board(letter)
		counter = 0
		word.each_char do |x|
			if letter == x
				board[counter] = letter
			end
			counter += 2
		end
		puts board
		board
	end

	def evaluate_letter(letter)
		if correct_letter?(letter)
			put_letter_on_board(letter)
			puts "#{@chances} chances left"
		elsif @previous_letters.to_s.include?(letter)
			puts board
			puts "You've already guessed that, goldfish."
			puts "#{@chances} chances left"		
		else
			puts board
			@chances -= 1 
			puts "Wrong Guess!"
			puts "#{@chances} chances left"
		end
		if !@previous_letters.to_s.include?(letter)
			@previous_letters.push(letter)
		end

		# guessed_letters = previous_letters.to_s
		# issue 2 to be fixed

		puts "You've guessed these letters: #{@previous_letters}"
	end

	def your_guess
		print "\n"
		print "What's your guess? "
		@letter = gets.chomp
		puts "**************"
		print "\n"
	end

	def play_game
		until @chances == 0 || !@board.include?("_")
			your_guess
			deal_with_invalid_input(@letter)
			evaluate_letter(@letter)
		end
		if @chances == 0
			puts "You're a failure and you've always been a failure."
			return "You're a failure and you've always been a failure."
		else
			puts "Success! The money and hoes will soon follow."
			return "Success! The money and hoes will soon follow."
		end
	end

end

#h = Hangman.new

#h.play_game