def my_robot_simulator(instructions)
    #starting point for both axes is 0 and bearing north by default
    coordinates = {:x => 0, :y => 0, :bearing => "north"} #creating a new hash with keys(symbols) and values
    ins = instructions.upcase.split("") #converting user input of instructions to uppercase and splitting them into an array of strings
    !ins.empty? && ins.each do |i|  #making sure instruction is not null before iterating through each letter
       if i == "R" 
            if coordinates[:bearing] == "north" #nestedif |if instruction is letter R and robot is facing north
                coordinates[:bearing] = "east"  #its directionS becomes east

            elsif coordinates[:bearing] == "south" #if it is letter R and robot is facing south, new bearing becomes west.
                coordinates[:bearing] = "west"

            elsif coordinates[:bearing] == "east"
                coordinates[:bearing] = "south"
            
            elsif coordinates[:bearing] == "west"
                coordinates[:bearing] = "north"
            end
        elsif i == "L"   #if part of the instructions contains a letter L, then it checks if the robot is facing north or other directions and changes t the correct bearing
            if coordinates[:bearing] == "north"
                coordinates[:bearing] = "west"

            elsif coordinates[:bearing] == "south"
                coordinates[:bearing] = "east"

            elsif coordinates[:bearing] == "east"
                coordinates[:bearing] = "north"
            
            elsif coordinates[:bearing] == "west"
                coordinates[:bearing] = "south"
            end
        elsif i == "A"  #letter A means advance, so if instruction contains A, already the default number for the axes is 0 (starting point)
            if coordinates[:bearing] == "north" #if its bearing north facing up, it continues on the positive y axis
                coordinates[:y] =+1
    
            elsif coordinates[:bearing] == "south"
                coordinates[:y] =-1
    
            elsif coordinates[:bearing] == "east"
                coordinates[:x] =+1
            
            elsif coordinates[:bearing] == "west"
                coordinates[:x] =-1
            
            end
    
        else 
          coordinates= "invalid entry" #if ins doesnt contain one of the 3 letters for instructions (R,L or A), it returns inavlid entry
    
        end
    end
    return "{x: #{coordinates[:x]}, y: #{coordinates[:y]}, bearing: :#{coordinates[:bearing]}}" #string interpolation

end
#sample hash
sample = "aaaa"

#a call to the function
res = my_robot_simulator(sample)
#display of results
puts res.inspect

