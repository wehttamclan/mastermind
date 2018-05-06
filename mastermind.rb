require './lib/difficulty.rb'
require './lib/answer_generator.rb'
require './lib/answer_checker.rb'
require './lib/printer.rb'
require './lib/play_game.rb'

@printer = Printer.new
@difficulty = Difficulty.new
@answer_gen = AnswerGen.new
@check = AnswerCheck.new
@game = PlayGame.new


quit = false
win = false
until quit || win
  @printer.main_menu  # (p)lay, (i)nstructions, (q)uit?
  option_select = gets.chomp.downcase.strip
  if option_select == 'p' || option_select == 'play'
    result = @game.game_flow
    if result == "quitter"
      @printer.quit
      quit = true
    elsif result == "cheater"
      @printer.cheat
      quit = true
    elsif result == "winner"
      @printer.win
      win = true
    end
  elsif option_select == 'i' || option_select == 'instructions'
    @printer.instructions
  elsif option_select == 'q' || option_select == 'quit'
    @printer.quit
    quit = true
  else
    @printer.invalid_option
  end
end
