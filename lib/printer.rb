class Printer
attr_reader :colors

  def initialize
    @colors = ["(r)ed", "(g)reen", "(b)lue", "(y)ellow", "(p)urple", "(o)range"]
  end

  def main_menu
    puts "              Welcome to MASTERMIND."
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def invalid_option
    puts "\nPlease select one of the given options.\n\n"
  end

  def difficulty_selection_prompt
    puts "\nPlease select a difficulty level."
    puts "(e)asy, (m)edium, (h)ard."
  end

  def start_prompt(d)
    puts "\nI have generated a sequence with #{d} elements made up of:"
    puts "#{@colors[0..d-1].join(", ")}."
    puts "Use (q)uit at any time to end the game."
    puts "\nWhat is your guess?"
  end

  def instructions
    puts "\nGet it yourself.\n"
  end

  def too_short
    puts "\nYour answer is too short."
  end

  def too_long
    puts "\nYour answer is too long."
  end

  def guess_again
    puts "\nGuess again."
  end

  def cheat
    puts "\nThanks for playing!  Goodbye for now."
  end

  def win(answer, number_of_guesses)
    puts "Congratulations!"
    puts "You guessed the sequence #{answer} in #{number_of_guesses} guesses."
  end

  def quit
    puts "\nOK BYE!"
  end
end
