# puts "Enter an array"
# dice = gets.chomp
# puts "Dice are #{dice}"

###
dice = [5,5,5]



def score(dice)
    # You need to write this method
    total_score = 0
    if dice == [] 
    #   puts "there are no dice"  
        return 0
    elsif dice != []
        ones_counter = 0 
        twos_counter = 0
        threes_counter = 0
        fours_counter = 0
        fives_counter = 0
        sixes_counter = 0
       # array_counter = 0
            dice.each do |i|
                if i == 1
                    ones_counter += 1
                end
                if i == 2
                    twos_counter += 1
                end
                if i == 3
                    threes_counter += 1
                end
                if i == 4
                    fours_counter += 1
                end
                if i == 5 
                    fives_counter += 1
                end
                if i == 6 
                    sixes_counter += 1
                end
            end
        
            if ones_counter <= 2 
                total_score += ones_counter * 100
                #puts ones_counter
                #puts total_score
            end
            # if ones_counter == 3
            #     total_score += 1000
            #     #puts total_score
            # end
            if ones_counter >= 4
                ones_counter -= 3
               total_score += 1000
                total_score += ones_counter * 100
                #puts total_score
            end

            if fives_counter == 3 

                # fives_counter = fives_counter - 3
                total_score += 500
            end   

            if fives_counter <= 2 
                total_score += fives_counter * 50
            end

            if fives_counter >= 4
                total_score += 500
                fives_counter -= 3
                total_score += fives_counter * 50
            end

            # if fives_counter != 3
            #     total_score += fives_counter * 50
            #     #puts fives_counter
            # end

            if ones_counter == 3 
                total_score += 1000
             #   return "from 1000 counters #{ones_counter twos_counter threes_counter fours_counter fives_counter}"
            end

            if twos_counter == 3 
                total_score += 200
            end   
            if threes_counter == 3 
                total_score += 300
            end   
            if fours_counter == 3 
                total_score += 400
            end  
            if sixes_counter == 3 
                total_score += 600
            end   

            return total_score;


        
    end
  #  end
  #pseudo code
  # check to see dice array is empty
  # loop thru array
  # check to see how many five exist that are not 3
  # check to see how many onces exits that are not 3
  # check to see if three numbers that are not ones exist
  # check to see if three ones exist
  
  
end
###
  puts score(dice)