class AnswerCheck

  def initialize
    @printer = Printer.new
    @color_options = ["r", "g", "b", "y", "p", "o"]
  end

  def check_guess(guess, answer)
    if guess == answer
      true
    else
      false
    end
  end

  def feedback(guess, answer)
    if guess.length < answer.length
      @printer.too_short
      @printer.guess_again
    elsif guess.length > answer.length
      @printer.too_long
      @printer.guess_again
    else
      @printer.guess_again(correct_positions, correct_elements) # print accuracy method instead
    end
  end

  def correct_positions(guess, answer)
    guess = guess.each_char.to_a
    answer = answer.each_char.to_a
    correct_positions = 0
    guess.length.times { |num|
      if answer[num] == guess[num]
        correct_positions += 1
      end
    }
    return correct_positions
  end

  def correct_elements(guess, answer)
    correct_element_count = 0
    colors = @color_options[0..guess.length-1]
    answer_color_count = {}
    guess_color_count = {}
    colors.each do |color|
      answer_color_count[color] = answer.count(color)
      guess_color_count[color] = guess.count(color)
    end
    answer_color_count.keys.each do |key|
      if answer_color_count[key] <= guess_color_count[key]
        correct_element_count += answer_color_count[key]
      elsif answer_color_count[key] > guess_color_count[key]
        correct_element_count += guess_color_count[key]
      end
    return correct_element_count
  end
end
