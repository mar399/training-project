#a function that takes all the values in a hash a returns their average
def my_average_mark(hash)
    sum = 0
    hash.each {|key,val| sum += val}
    
    puts sum/(hash.length)

end

class_csci101 ={
    "margot" => 17,
    "june" => 8,
    "colin" => 14,
    "lewis" => 9
}

puts my_average_mark(class_csci101)