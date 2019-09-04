require 'colorize'
require "tty-prompt"
require "tty-font"
require_relative "menu_functions"
require_relative "question"
prompt = TTY::Prompt.new
font = TTY::Font.new(:doom)

puts font.write("         FOOTYHUB", letter_spacing:1)
puts font.write("ALL FOOTY THINGS", letter_spacing:1)

score_list = {
    name: "",
    score: 0
}

question_array = []
q1 = Question.new("Who won the championship in 2017","Richmond","Brisbane","Essendon","Collingwood","Richmond")
q2 = Question.new("Who won brownlow medal in 2018","Tom","Edie","Rob","John","Tom")
q3 = Question.new("For what offense, was a crows fan given a season-long ban in may","Slapping a Bulldogs player on the bum","Impersonating Taylor Walker","Playing the Richmond theme song at a members' function","Interrupting Don Pyke at a press conference","Slapping a Bulldogs player on the bum")

question_array << q1
question_array << q2
question_array << q3

loop do
selection = prompt.select("Select from the options below?") do |option|
    option.choice :History, 1
    option.choice :"Rules", 2
    option.choice :"Clubs List", 3
    option.choice :"Winners and Brownlow list", 4
    option.choice :"Test your Footy Knowledge", 5
    option.choice :Exit, 6
  end

break if [selection] == [6]

if [selection] == [1]
            history
    elsif [selection] == [2]
                File.open("rules.txt","r").each_with_index do |line,index|
                if index == 0
                puts line.upcase.colorize(:color => :yellow)
                else
                puts line.colorize(:color => :yellow)
                end
                # end
                # end
                end
              elsif [selection] == [3]
                display_team_list
                # puts "Pick a team to display more information"
                
    elsif [selection] == [5]
     take_quiz(question_array)
end
end

