#a function that checks if the values of an array are either sorted in an ascending or descending order
def my_is_sort(array)
    asc= array.each_cons(2).all? {|a,b| a<=b} 
    dsc= array.each_cons(2).all? {|a,b| a>=b} 
    p asc
    p dsc
    return asc ? asc : dsc ? dsc : false
end

puts my_is_sort([2,3,1])

