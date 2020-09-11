def rostring(str)
    var = str.split().rotate(1).join("")
    return var  #changing the first letter of a string to the last position while other letters stay in the same position
#    if string.length==1
#     return string.to_s.upcase
 #split it first to make it into an array of strings to access the rotate method
#     end
    #return var.join(" ") #join afterwards to become strings once again
end
puts rostring("hajiya nh")

