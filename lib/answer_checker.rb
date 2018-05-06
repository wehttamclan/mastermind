class AnswerCheck

  def initialize
    @printer = Printer.new
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
      @printer.guess_again # print accuracy method
    end
  end

  def accuracy(guess, answer)
  end

end
