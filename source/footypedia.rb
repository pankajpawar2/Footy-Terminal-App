require 'colorize'
require "tty-prompt"
require "tty-font"
require 'rainbow'
require_relative "menu_functions"
require_relative "question"
prompt = TTY::Prompt.new
font = TTY::Font.new(:doom)
# puts Rainbow("this is red").blink

# argv_input = []
# argv_input << ARGV[0]
# if argv_input == "History"
#   history
# end
loop do
  begin
    puts "Welcome to FOOTYPEDIA".blink
    puts "Login to continue\nEnter your username"
    input = gets.chomp
    if input == "" || input[0] == Integer
      raise
    end
    puts "Enter your password"
    password = STDIN.noecho(&:gets).chomp
    user_verifiation(input, password)  
    break
    rescue 
      puts "Oopsss. Something happened. Username cannot be blank/Cannot start with a number"
  end
end


puts font.write("         FOOTYHUB", letter_spacing:1).blink
puts font.write("ALL FOOTY THINGS", letter_spacing:1)

question_array = []
q1 = Question.new("Who won the championship in 2017","Brisbane","Richmond","Essendon","Collingwood","Richmond")
q2 = Question.new("How many points a team gets if they score a goal","5","1","6","3","6")
q3 = Question.new("Who won brownlow medal in 2018","Eddie Betts","Tom Mitchell","Dustin Martin","Scott Pendlebury","Tom Mitchell")
q4 = Question.new("For what offense, was a crows fan given a season-long ban in may","Slapping a Bulldogs player on the bum","Impersonating Taylor Walker","Playing the Richmond theme song at a members' function","Interrupting Don Pyke at a press conference","Slapping a Bulldogs player on the bum")
q5 = Question.new("How many points for a disposal","5","1","6","3","1")

question_array.push(q1,q2,q3,q4,q5)
# question_array << q2
# question_array << q3

loop do
  selection = prompt.select("Select from the options below?") do |option|
        option.choice :History, 1
        option.choice :"Rules", 2
        option.choice :"Clubs List", 3
        # option.choice :"Winners and Brownlow list", 4
        option.choice :"Test your Footy Knowledge", 4
        option.choice :Exit, 5
      end

      break if [selection] == [5]

      if [selection] == [1]
            history
              elsif [selection] == [2]
              rules
                elsif [selection] == [3]
                display_team_list          
                  elsif [selection] == [4]
                  take_quiz(question_array)
      end
end
