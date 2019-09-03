require 'colorize'
require "tty-prompt"
require_relative "history"
prompt = TTY::Prompt.new

puts "Welcome to FootyHub - Get all the Footy Information".colorize (:red)

choices = ["History", "Rules", "Quiz", "Clubs", "Feedback"]

loop do
selection = prompt.select("Select from the options below?") do |option|
    option.choice :History, 1
    option.choice :Rules, 2
    option.choice :Quiz, 3
    option.choices Clubs: 4, Feedback: 5
  end
#   puts "You have selected #{choices[selection-1]}"

if choices[selection-1] == "History"
    history
end

end

