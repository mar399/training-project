# n = 4 # Set number of rows
# i = 0
# 1.upto(n) do
#   #n.times do
#   #  print ' '
#   #end
#   print ' ' * n

#   #(2 * i - 1).times do
#   #  print '*'
#   #end
#   print '*' * (i+=1)

#   print "\n"

#   n -= 1
#   i += 1
# end
#  c="|"
# print c.center(10)

class Person
  attr_accessor :name
  def initialize(name = 'tala')
    @name = name
  end
end

tala = Person.new 'yunus'
tala.name = 'maryam'
# puts tala.name

puts @name