class Scrabble

  def score_letters(word)
    word_array = word.split('')
    @score_array = word_array.map do |letter|
      point_values[letter.upcase]
    end
  end

  def score(word)
    if word == nil
      score = 0
    else
      score_letters(word)
      score = @score_array.inject(0) do |sum, score|
        sum += score
      end
    end
    score
  end

  def score_with_multipliers(word, array, multiplier = 1)
    score(word)
    multiplied_array = []
    @score_array.each_with_index do |score, index|
      multiplied_array << (score * array[index])
    end
    score= multiplied_array.inject(0) do |sum, num|
      sum += num
    end
    if @score_array.count >= 7
      score += 10
    end
    score * multiplier
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
