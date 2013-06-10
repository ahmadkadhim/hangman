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

	def test_evaluating_input
		assert @game.check_valid_input?("e")
		assert !@game.check_valid_input?("9")
	end

end