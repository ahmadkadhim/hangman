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

	def test_dealing_with_invalid_input
		assert_equal @game.check_valid_input("9"), "invalid guess: singular lowercase letters only, please"
	end
end