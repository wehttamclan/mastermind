class PlayGame

  def initialize
    @printer = Printer.new
    @difficulty = Difficulty.new
    @answer_gen = AnswerGen.new
    @check = AnswerCheck.new
  end

  def choose_difficulty
    @printer.difficulty_selection_prompt # (e)asy, (m)edium, (h)ard
    difficulty_selection = gets.chomp.downcase.strip
    diff_level(difficulty_selection)
  end

  def diff_level(difficulty_selection)
    if difficulty_selection == 'e' || difficulty_selection == 'easy'
      d = 4
    elsif difficulty_selection == 'm' || difficulty_selection == 'medium'
      d = 5
    elsif difficulty_selection == 'h' || difficulty_selection == 'hard'
      d = 6
    elsif difficulty_selection == 'q' || difficulty_selection == 'quit'
      d = 'q'
    else
      @printer.invalid_option
      choose_difficulty
    end
    return d
  end

  def play(d, answer)
    guess = gets.chomp.downcase.strip
    if @check.check_guess(guess, answer)
      return "winner"
    elsif guess == 'q' || guess == 'quit'
      return "quitter"
    elsif guess == 'c' || guess == 'cheat'
      puts "The answer was: #{answer}."
      return "cheater"
    else
      @check.feedback(guess, answer)
    end
  end


  def game_flow
    d = choose_difficulty
    if d == 'q' || d == 'quit'
      result = "quitter"
    else
      @printer.start_prompt(d) # Make your guess.
      answer = @answer_gen.generator(d)
      puts "(#{answer})"
      until result == "quitter" || result == "winner" || result == "cheater"
        result = play(d, answer)
      end
    end
    return result
  end
end
