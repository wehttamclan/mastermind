require 'pry'

class Difficulty

  def diff_level(difficulty_selection)
    if difficulty_selection == 'e' || difficulty_selection == 'easy'
      d = 4
    elsif difficulty_selection == 'm' || difficulty_selection == 'medium'
      d = 5
    elsif difficulty_selection == 'h' || difficulty_selection == 'hard'
      d = 6
    else
      puts "Please select one of the available options."
    end
    return d
  end


end
