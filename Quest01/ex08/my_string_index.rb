def my_string_index(haystack,needle) #checks for the first occurence of a letter in a word(s) returns the index
    return haystack.index(needle)
end 

puts my_string_index("hello", "ll")


def my_string_index(haystack,needle)

    haystack=haystack.split("")
#     for item in haystack
#       if haystack.include?(needle)
#         # if item==needle

#       return haystack.index(needle)

#       else
#          return -1
#       end
#     end

# end
# puts my_string_index("hello", "k")

def my_string_index(haystack,needle)
  haystack_array = haystack.split("")
    haystack_array.each do |character, index|
      if character == needle 
         return index 
      else
         return -1    
     end
    end

  end
puts my_string_index("hello", "l")

def my_string_index(haystack,needle)
  haystack_array = haystack.split("")
  index = -1
  for item in haystack_array
      if item == needle 
          index = haystack_array.index(item)
      end
  end
  return index
end
puts my_string_index("hello", "o")

