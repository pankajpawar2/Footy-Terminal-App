require 'colorize'

def test_teams_championships
    club = "Carlton"
    result = teams_championships(club)
    if result.class == String
      puts "Test passes!".colorize(:green)
    else 
      return "Test fails".colorize(:red)
    end  
end 
test_teams_championships