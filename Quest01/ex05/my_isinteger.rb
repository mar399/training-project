# def my_isinteger(n) 
#     #begin defining a function that checks if a variable is an integer or not
#     if n.is_a? Integer
#         puts 1 
#     else puts 0
#     end
# end
 #checking if a number is an integer or not
def my_isinteger(n) 
    return n.is_a?(Integer) ? 1 : 0
end


# def my_isinteger(n) 
#     n % 1 == 0? true : false
# end


puts my_isinteger(4)