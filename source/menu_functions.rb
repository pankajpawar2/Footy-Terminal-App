require 'csv'
require 'tty-pie'


def user_verification(input, password)
  puts `clear`
  row = File.read("USERS.csv")
  row_data = CSV.parse(row, :headers => true)
  users = []
  row_data.each_with_index do |line, index|
    row = line.to_hash
    if row['Username'] == input && row['Password'] == password
      puts "Welcome #{input.capitalize}"
      break
    elsif index == row_data.length - 1
      puts "User does not exist"
      puts "Logged in as guest"
    end
  end
end

# Defining a function to display History

def check_history
  puts `clear`
  File.open("HISTORY.txt", "r").each_with_index do |line, index|
    if index == 0
      puts line.upcase.blink
    else
      puts line + "\n"
    end
  end
end

# Defining a function to display Rules

def check_rules
  File.open("RULES.txt", "r").each_with_index do |line, index|
    if index == 0
      puts "##########################"
      puts line.upcase.blink
      puts "##########################"
    else
      puts line
    end
  end
end

def take_quiz(array)
  puts `clear`
  score = 0
  score_report = {}
  puts "Enter your name"
  name = gets.strip
  puts "Get ready for the challenge"
  array.each do |questions|
    puts "Question. #{questions.question}"
    puts "1. #{questions.option1}"
    puts "2. #{questions.option2}"
    puts "3. #{questions.option3}"
    puts "4. #{questions.option4}"
    input = gets.strip
    if input.to_s != input.to_i.to_s
      puts "Invalid input. Try again"
    elsif input == "1" && questions.option1 == questions.answer
      puts "Correct answer"
      score += 1
    elsif input == "2" && questions.option2 == questions.answer
      puts "Correct answer"
      score += 1
    elsif input == "3" && questions.option3 == questions.answer
      puts "Correct answer"
      score += 1
    elsif input == "4" && questions.option4 == questions.answer
      puts "Correct answer"
      score += 1
    else
      puts "Incorrect answer"
    end
  end
  puts "YOUR SCORE IS #{score}".blink
  File.open("QUIZSCORE.csv", "a") do |file|
    file << "\n#{name},#{score}"
  end
end

def display_team_list
  puts `clear`
  teams_array = ["Geelong", "Adelaide", "Essendon", "Port Adelaide", "North Melbourne", "Melbourne", "St Kilda", "Brisbane Lions",
                 "Gold Coast", "Freemantle", "Richmond", "West coast", "Collingwood", "Sydney Swans", "Greater Western Sydney", "Hawthorn", "Western Bulldogs", "Carlton"]
   puts "########################################"
   puts teams_array.sort
   puts "########################################"
  loop do
    puts "Enter your favourite team"
    print "> "
    input = gets.strip

    if teams_array.include? input
      teams_championships(input)
      break
    elsif teams_array.include? input.capitalize
      teams_championships(input.capitalize)
      break
    else
      puts "Incorrect entry. Please try again"
    end
  end
end

def teams_championships(team)
  puts `clear`
  row = File.read("CHAMPIONSHIPS.csv")
  row_data = CSV.parse(row, :headers => true)
  championships = []
  row_data.each do |line|
    row = line.to_hash
    if row['Premiership Team'] == team
      championships << row
      puts "Premiership Champions: #{row['Year']}"
    end
  end
  puts Rainbow("#{team} has won the flag #{championships.length} times").bright.blink
  data = [
    { name: team, value: championships.length.to_i, color: :bright_yellow, fill: '@' },
    { name: 'Others', value: 110, color: :bright_blue, fill: '@' }
  ]
  pie_chart = TTY::Pie.new(data: data, radius: 8)
  print pie_chart
end
# if ARGV[0] = "history"
#    check_history
# end