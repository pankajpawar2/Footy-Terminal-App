
require 'csv'
require 'tty-pie'
def history
   puts `clear`
    File.open("history.txt","r").each_with_index do |line,index|
        if index == 0
            puts line.upcase.blink
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
        puts "YOUR SCORE IS #{score}"
      #   score_list(name,score)
end

# def score_list(name,score1)
#    puts `clear`
#     score = []
#     score_list_hash = {
#         "name" => name,
#         "score" => score1
#     }
#     score << score_list_hash
#     # File.write("Book1.csv","a").each do |line|
#     #     line << score_list_hash
#     # end
#     puts "Your"score
# end

def display_team_list
   puts `clear`
   teams_array = ["Geelong","Adelaide","Essendon","Port Adelaide","North Melbourne","Melbourne","St Kilda","Brisbane Lions",
"Gold Coast","Freemantle","Richmond","West coast","Collingwood","Sydney Swans","Greater Western Sydney","Hawthorn","Western Bulldogs","Carlton"]
puts teams_array.sort
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
puts Rainbow("#{team} has won #{championships.length} times").bright.blink
data = [
  { name: team, value: championships.length.to_i, color: :bright_yellow, fill: '@' },
  { name: 'Others', value: 110, color: :bright_green, fill: '@' }
]
pie_chart = TTY::Pie.new(data: data, radius: 8)
print pie_chart
end