#a function that uses asc and desc symbols as one of its arguments and an array as the other argment to sort the elements of the array in an ascending or descending order
def my_sort(array,order)
    # array.sort do |a,b|

        if (order.is_a?(Symbol) && [:asc,:desc].include?(order))
            return order==:asc ? array.sort : array.sort.reverse
        else
            return
        end
end

puts my_sort([2,3,4,5], :desc)

