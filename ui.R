library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Exploding Tens Dice System"),
  sidebarPanel(
    h3('Total and Kept Dice'),
    numericInput('total', 'Total Dice', 0, min = 0),
    numericInput('kept', 'Kept Dice', 0, min = 0),
    actionButton('Go', label = "Roll")
  ),
  mainPanel(
    h3('The Dice System'),
    p('Exploding tens is a dice system for the 7th Sea role playing game, used to simulate randomness
      in trying to complete a task and in combat. The system uses ten sided dice with numbers 1-10. 
      A player rolls a total number of dice and keeps a subset of the results, selecting the highest 
      and adding them for a total. A roll is referred to as X keep Y, i.e. 4 keep 2 means a player 
      rolls six dice and keeps the three highest results. If that player rolled 8, 3, 2, 5, he would 
      keep the 8 and 5 and add them for 13.'),
    p('The name "Exploding Tens" comes from the result of a player rolling a 10. Whenever this 
      happens, the player rolls that die again and adds it to the total while keeping the original 10. 
      So if a player rolled 5 keep 3 and got 2, 10, 9, 7, 6, and rerolled the 10 for a 5, she would add
      the 10, 9, 7 and the extra 5 for a total of 31. Of course, the extra roll might also result in 
      a 10 which in turn "explodes" meaning a single die can add a lot to the total.'),
    p('For more on 7th Sea and the exploding tens dice system, visit'), a('http://www.alderac.com/7thsea/'),
    p('In order to speed the process of rolling actual dice, picking the biggest ones and adding them up,
      this app simulates the process. It takes a total number of dice and a number of kept dice and returns
      a list of three objects: a total, the kept rolls including explosions, and the original roll.'),
    h3('Your Roll'),
    h4('Total Dice:'), verbatimTextOutput("total"),
    h4('Kept Dice:'), verbatimTextOutput("kept"),
    h4('Roll Results:'), verbatimTextOutput("roll")
  )
))