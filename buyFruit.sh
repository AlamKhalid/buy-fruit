#!/bin/bash
# take choice as input
echo "Enter your choice (quit|QUIT|q|Q/buy|BUY|b|B)"
while [ true ]
do
  read choice
  while [ ${#choice} -eq 0 ]
  do
    echo "You did not enter anything, please enter your choice!"
    read choice
  done
  # check choice
  choices=(quit QUIT q Q BUY buy b B)
  while [[ ! " ${choices[*]} " =~ " ${choice} " ]]
  do
    echo "Sorry, '$choice' is not a valid choice. Please enter 'quit' or 'buy'."
    read choice
  done
  # check quit choice
  quit_choices=(quit QUIT q Q)
  if [[  " ${quit_choices[*]} " =~ " ${choice} " ]]
  then
    echo "-----Thanks for your order! See you next time!-----"
    exit 0
  fi
  # other it would be buy choice, no need to check it again
  # take name as input
  echo "Please enter your name?"
  read name
  # name should have a length greater than 0
  while [ ${#name} -eq 0 ]
  do
    echo "You did not enter anything, please enter your name!"
    read name
  done
  # take telephone as input
  echo "Your telephone number?"
  read phone
  # telephone should have a length greater than zero
  while [ ${#phone} -eq 0 ]
  do
    echo "You did not enter anything, please enter your telephone number!"
    read phone
  done
  # take fruit
  echo "What kind of fruit do you want: apple/pear/cherry"
  read fruit
  # fruit should have a length greater than zero
  while [ ${#fruit} -eq 0 ]
  do
    echo "You did not enter anything, please enter your fruit!"
    read fruit
  done
  # check valid fruit choices
  fruits=(apple pear cherry)
  while [[ ! " ${fruits[*]} " =~ " ${fruit} " ]]
  do
    echo "Sorry, your choice is not right. Please enter a kind of fruits (apple/pear/cherry)"
    read fruit
  done
  # take weight
  echo "How many kg do you want?"
  read kg
  # validate kg length
  while [ ${#kg} -eq 0 ]
  do
    echo "You did not enter anything, please enter your kg!"
    read kg
  done
  # kg should be more than 0
  while [ "$(($kg))" -lt 1 ]
  do
    echo "Weight should NOT be less than 1 kg. How many kg do you want?"
    read kg
  done
  # print summary
  echo "==============================================================="
  echo "Hello $name, here is the summary of your order:"
  now=`date`
  echo "Date: $now"
  echo "---------------------------------------------------------------"
  echo "Your telephone number is $phone"
  echo "You have bought $kg kg $fruit"
  echo "A kg of $fruit is 3 pounds, so it costs $(($kg * 3)) pounds."
  echo "==============================================================="
  echo "Do you want to start another order? Please enter a choice: (quit|QUIT|q|Q/buy|BUY|b|B)"
done
