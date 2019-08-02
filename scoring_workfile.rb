# puts "Enter an array"
# dice = gets.chomp
# puts "Dice are #{dice}"

dice = [1,2,3,5,5]



def score(dice)
    # You need to write this method
  
    if dice == [] 
      puts "there are no dice"  
        return 0
    elsif dice != []
        fives_counter = 0 
       # array_counter = 0
            dice.each do |i|
                if i == 5
                    fives_counter += 1
                end
            end
        return fives_counter
    end
  #  end
  #pseudo
  # check to see dice array is empty
  # loop thru array
  # check to see if a single five exists
  # check to see if a single one exists
  # check to see if three numbers that are not ones exist
  # check to see if three ones exist
  
  
end

  puts score(dice)