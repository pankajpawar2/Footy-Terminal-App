# Software Development Plan
Software development plan states the purpose of the terminal application, providing a list of functions/features that will be implemented in the application.

## Contents
*  Statement of Purpose
*  Features
*  User Interactions 
*  Error Handling
*  Control Flow Diagram
*  Feature Implementation Plan
*  Test Cases
*  Project Development 

## Help 

To run my app use the following command:

```bash 
ruby footypedia.rb
```

## Statement of Purpose
The Terminal applications is called "FOOTYHUB". The users of the application will be able to understand the history of Australian Football League(AFL) and understand the rules and common terms used in the game. Australian Football League is common sports played across australia, with Victoria being the dominant state. It has around 8 teams participating each year from total of 18.

Users will be presented with a login screen when the application starts. Once user is verified, the user is presented with home page with different menu options.
Users can choose any option and depending on the selection, will be directed to the corresponding page.
Some of the data is stored in CSV/Text files and it is being retrieved depending on the user input.

Users will be able to check the list of active clubs and depending on the chosen team, can see how many championships they have won till date. Users can also take a quiz which will help them to test their footy knowledge.

This application is mainly intended for people to understand the game of Footy and anyone who loves the game can benefit from this application.

## Features
The application has a list of features, which are provided below

* ***User Login***

This is the first feature of the application and provides users access to use the application.
![Login Page](Login.png)

The login page checks if the username and password is correct. This is done by reading the "Users.csv" file and checking if the username and password is correct.
*user_verification* is the function used to perform user verification. This function takes two arguments - username and password. The function then checks the csv file to complete user verification.
If the user does not exist, there is an option to continue as guest.