gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_scrabble_class_exists
    game = Scrabble.new

    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    score = game.score("hello")

    expected = 8
    actual = score

    assert_equal expected, actual
  end

  def test_it_will_score_zero_for_a_blank_string
    game = Scrabble.new
    score = game.score("")

    expected = 0
    actual = score

    assert_equal expected, actual
  end

  def test_it_will_score_zero_for_nil
    game = Scrabble.new
    score = game.score(nil)

    expected = 0
    actual = score

    assert_equal expected, actual
  end

  def test_score_with_multipliers_scores_words_mulitplied_by_array_values
    game = Scrabble.new
    score_with_multipliers = game.score_with_multipliers('hello', [1,2,1,1,1])

    expected = 9
    actual = score_with_multipliers

    assert_equal expected, actual
  end

  def test_score_with_multipliers_scores_works_with_multiplier
    game = Scrabble.new
    score_with_multipliers = game.score_with_multipliers('hello', [1,2,1,1,1], 2)

    expected = 18
    actual = score_with_multipliers

    assert_equal expected, actual
  end

  def test_score_with_multipliers_works_with_sparkle
    game = Scrabble.new
    score_with_multipliers = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    expected = 58
    actual = score_with_multipliers

    assert_equal expected, actual
  end
end
