
def my_christmastree(no_of_branches)
for i in 1..no_of_branches 
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




