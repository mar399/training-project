
def my_christmastree(no_of_branches)
  space = (size<5) ? 3*size*size : size * size
  start_treeheight =4
  star=1


for i in 1..no_of_branches do
  for y in 1..start_treeheight
    puts "#{'' * space}"

"#{"*" * pixel}"
  if y <start_treeheight
    star +=2
    space -=1
  end
 end
 start_treeheight +=1
 star -=2
 space +=1
 space = ((size < 5) ? 3 * size * size : size * size) - (size/2) #set the required space for the stem
    stem = (pixel.modulo(2) == 1 && size.modulo(2) == 0) ? size + 1 : size #set the size of the stem to fit in the middle for the tree
    for y in 1..size do #loop through the given size of the tree
        puts "#{' '*space}#{'|'*stem}" #print the stem of the tree
    end
end




   n = 4 # Set number of rows
   i = 1
   1.upto(n) do
     #n.times do
     #  print ' '
     #end
     print ' ' * n
   
     #(2 * i - 1).times do
     #  print '*'
     #end
     print '*' * (2 * i -1)
   
     print "\n"
   
     n -= 1
     i += 1
   end
    c="|"
   print c.center(10)
end

# 1 5 11 17 25
# # 4,5,6,7,8 number of rows in branches




