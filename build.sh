chmod +x ./build.sh
# copy across files to distribution directory
mkdir dist
cp ./footyhub.rb ./dist
cp ./menu_functions.rb ./dist
cp ./question.rb ./dist
cp ./test.rb ./dist
cp ./CHAMPIONSHIPS.csv ./dist
cp ./QUIZSCORE.csv ./dist
cp ./USERS.csv ./dist
cp ./HISTORY.txt ./dist
cp ./RULES.txt ./dist

# install all gems
gem install 'colorize'
gem install 'tty-prompt'
gem install 'tty-font'
gem install 'rainbow'
gem install 'tty-pie'


