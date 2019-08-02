puts "Enter an array"
dice = gets.chomp
puts "Dice are #{dice}"



def score(dice)
    # You need to write this method
  
    if dice == [] 
      return 0
    end
   score = 0
   dice.sort
    a = 0
  loop while a > dice.length
    a += 1
    fives_counter = 0
    if dice[a] == 5
      fives_counter += 1
    if fives_counter == 1
     return 50
    end 
  end
   #if dice.includes!(5) && includes()
   
   
  #pseudo
  # check to see dice array is empty
  # loop thru array
  # check to see if a single five exists
  # check to see if a single one exists
  # check to see if three numbers that are not ones exist
  # check to see if three ones exist
  
  
  
  
    # score = 0
    # sorted_dice = dice.sort # Sort the rolls
  
    # while sorted_dice.length > 0
    #   val = sorted_dice.shift
    #   puts val
    #   if sorted_dice.length >= 2 && val == sorted_dice[0] && val == sorted_dice[1]  # a triple!
    #     score += val == 1 ? 1000 : val * 100
    #     sorted_dice.shift(2)
    #   else
    #     score += 100 if val == 1
    #     score += 50  if val == 5
    #   end
    # end
  
    return score
  
  
  
  
  
  
  
  
  end