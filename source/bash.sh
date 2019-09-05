chmod +x ./build.sh
# copy across files to distribution directory
mkdir dist
cp ./footypedia.rb ./dist
cp ./menu_functions.rb ./dist
cp ./question.rb ./dist
cp ./test.rb ./dist
cp ./CHAMPIONSHIPS.rb ./dist
cp ./QUIZSCORE.rb ./dist
cp ./USERS.rb ./dist
cp ./HISTORY.rb ./dist
cp ./RULES.rb ./dist

# install all gems
gem install 'colorize'
gem install 'tty-prompt'
gem install 'tty-font'
gem install 'rainbow'
gem install 'tty-pie'


