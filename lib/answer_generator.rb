require 'pry'

class AnswerGen

  def initialize
  end

  def generator(d)
    answer = ""
    colors = ['r', 'y', 'b', 'g', 'o', 'p']
    colors = colors[0..d-1]
    if d == 4
      answer_length = 4
    elsif d == 5
      answer_length = 6
    elsif d == 6
      answer_length = 8
    end
    answer_length.times { answer += colors.sample }
    return answer
  end
end
