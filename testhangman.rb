#test hangman

require 'test/unit'
require_relative 'hang_final.rb'

class TestHangman < Test::Unit::TestCase
	
	def setup
		@game = Hangman.new
	end

	def test_initialize_variables
		assert @game.is_a?(Hangman)
		assert_equal 8, @game.chances
		assert_equal "easy", @game.word
		assert_equal "_ _ _ _ ", @game.board
		assert_equal @game.previous_letters, []
	end

	def test_valid_input
		assert @game.check_valid_input?("c")
		assert !@game.check_valid_input?("9")
	end

	def test_correct_letter
		assert @game.correct_letter?("e")
		assert !@game.correct_letter?("c")
	end

	def test_put_letter_on_board
		assert_equal @game.put_letter_on_board("c"), "_ _ _ _ "
		assert_equal @game.put_letter_on_board("e"), "e _ _ _ "
	end

	def test_play_game
		@game.chances = 0
		assert_equal @game.play_game, "You're a failure and you've always been a failure."
		@game.chances = 8
		@game.board = "e a s y "
		assert_equal @game.play_game, "Success! The money and hoes will soon follow."
		@game.board = "_ _ _ _ "
	end
end