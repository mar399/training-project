# a function that takes each item of an array and multiplies it by 2
def my_map_mult_two(array)
  array.map { |x| x * 2 }
end
puts my_map_mult_two([0,2,4,6,8])
