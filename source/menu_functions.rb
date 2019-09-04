
require 'csv'
def history
    File.open("history.txt","r").each_with_index do |line,index|
        if index == 0
            puts line.upcase.colorize(:color => :yellow)
        else
        puts line.colorize(:color => :yellow)
        end
    end
end

def take_quiz(array)
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
        puts "YOUR SCORE IS #{score}"
        score_list(name,score)
end

def score_list(name,score1)
    score = []
    score_list_hash = {
        "name" => name,
        "score" => score1
    }
    score << score_list_hash
    # File.write("Book1.csv","a").each do |line|
    #     line << score_list_hash
    # end
    puts score
end

def display_team_list
   teams_array = ["Geelong","Adelaide","Essendon","Port Adelaide","North Melbourne","Melbourne","St Kilda","Brisbane",
"Gold Coast","Freemantle","Richmond","West Coast","Collingwood","Sydney","Greater Western Sydney","Hawthorn","WesternBulldogs","Carlton"]
puts teams_array.sort
loop do
puts "Enter your favourite team"
print "> "
input = gets.strip

if teams_array.include? input
   teams_championships(input)
   break
else
   puts "Incorrect entry. Please try again"
end
end
end


def teams_championships(team)
row = File.read("Scores.csv")
row_data = CSV.parse(row,:headers => true)
championships = []
row_data.each do |line|
  row = line.to_hash
  if row['Premiership Team'] == team
      championships << row
      puts "Premiership Champions: #{row['Year']}"
  end
end
puts "#{team} has won #{championships.length} times"
end