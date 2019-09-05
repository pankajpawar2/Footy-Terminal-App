require 'colorize'
require_relative 'menu_functions'
require_relative 'question'



##############################################################
# Test user verification method if user enters blank username
##############################################################
def test_user_verification
    name = ""
    password = "abcd"
    user_verification(name,password)
end 
b = test_user_verification





