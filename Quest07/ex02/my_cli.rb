# h= { :a=>1 ,:b=>2 ,:c=>3}
# def where (key,value)
#   h.each do |key,value| return "#{key} => #{value}" where h[:key] = key
#   end
  # h.select {|key,value| return "#{key} => #{value}"} 
# end

# puts where(:a,1)

require 'csv'
#  CSV.foreach('customers.csv',headers:true) do |row|
# puts row.inspect
#  end

 average_money_spent= Array.new
   CSV.foreach('customers.csv', converters: :numeric, headers:true) do |row|
    puts row.inspect
     average_money_spent << row[2] / row[1]
   end
  #  puts average_money_spent.inspect
