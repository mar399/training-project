def class_average(class_results) #a function that returns the average scores of college students in a hash
    sum=0
    class_results.each {|key,val| sum +=val}
    return sum/(class_results.length).to_f
end
puts class_average({"John" => 7,"Margot" => 8, "Jules" => 4 ,"Marco" => 19})
