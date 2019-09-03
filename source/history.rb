def history
    File.open("history.txt","r").each_with_index do |line,index|
        if index == 0
            puts line.capitalize.colorize(:color => :light_blue, :background => :red)
        else
        puts line.colorize(:color => :light_blue, :background => :red)
        end
    end
end
