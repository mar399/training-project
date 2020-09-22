class MyRedis #creating a class

  def initialize()
   @a_hash=Hash.new #constructor that makes an object a hash upon calling the new method during creating that object. All objects of this class will have an instance variable @a_hash upon creating them
  end

  def my_set(key,value) #a function that sets a value to a key
    @a_hash[key]= value 
  end
  def my_get(key) #a function that gets a value using its key
   @a_hash.has_key? && @a_hash[key] #checks if the hash has that key and returns the corresponding value
  end 

   def my_mset (*pairs) #a function that collects arguments asterisk in the parameter definition makes it an array and parameters can be more than one or empty
     if !pairs.empty? #first checks if values have been entered
      pairs.each do|pair| #loop through each value of the array eg["e",2] ["b", 4]
        pair.each  do|item| #loops further ["e"] [2] ["b"] [4]
          a = my_set(item[0],item[1]) 
          a.inspect
        end
      end
     else 
     puts "please insert atleast a pair of key and value"
     end
   end

  def my_mget(keys) #get a set of values in an array from a set of provided keys
    values=[]
    keys.each do |i| #looping through each key one by one
      @a_hash.has_key?(i)? values << @a_hash[i]: values=[] #check if the hash has the key then push to the new array, named value, created if not empty array
    end
  end


    def my_del(keys) #deleting key value pairs from the hash using the keys provided
      if !@a_hash.empty? && keys.each do |i|
        @a_hash.has_key?(i) && @a_hash.delete(i)
         end
      end
    end

    def my_exists(key) #check if a hash has a particular key
      # key.each do |i|
        @a_hash.has_key?(key)? true : false
    end

    # def my_rename(key,new_key)
    #  if @a_hash.has_key?(key) && !@a_hash.has_key?(new_key) && @a_hash.key = new_key
    #  end
    # end
    def my_rename (key, new_key)
      # @my_hash.clone.each_key do |k|
          if @a_hash.has_key?(key) && !@a_hash.has_key?(new_key)
              @a_hash[new_key] = @a_hash.delete (key) 
              return true
          else
              return false
          end
      # end
    end


    def my_show() #displays the hash
      @a_hash
    end

    def backup() #writes a copy of the file into a file named my_dump.rdb
      File.open("my_dump.rdb", "w") {|file| file.write(@a_hash.inspect) }
    end

      def restore() #restoring file from backup file
        File.open("my_dump.rdb", "r") {|file| @a_hash = eval(file.read)} #accepts a string and evaluates to a hash
      end
end

# myRedis = MyRedis.new
# myRedis.my_mset([['a', 3], ['b', 8], [3, 'i']])
# myRedis.my_set('c', 45)
# myRedis.backup
# puts myRedis.my_show
# puts myRedis.my_del(['c'])
# puts myRedis.my_show
# puts myRedis.my_rename('b', 'w')
# puts myRedis.my_show
# myRedis.restore
# puts myRedis.my_show
# puts myRedis.my_get 'a'

myredis=MyRedis.new
hashtwo=MyRedis.new
 myredis.my_mset([['a', 3], ['b', 8], [3, 'i']])
  myredis.backup
p myredis.my_show
myredis.my_exists('a')
myredis.restore
 myredis.my_rename('a','z')
 myredis