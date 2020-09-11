class Myredis

  def initialize()
   @a_hash=Hash.new
  end

  def my_set(key,value)
    @a_hash[key]= value
  end
  def my_get(key)
   @a_hash.has_key? && @a_hash[value]
  end 

   def my_mset (*args)
     if !args.empty?
      args.each do|pair|
        pair.each  do|item| (# try using _withindex )
          my_set(item[0],item[1])
        end
      end
     else 
     puts "please insert atleast a pair of key and value"
     end
   end

  def my_mget(keys)
    values=[]
    keys.each do |i|
      @a_hash.has_key?(i)? values << @a_hash[i]: values=[]
    end
  end


    def my_del(keys)
      if !@a_hash.empty? && keys.each do |i|
        @a_hash.has_key?(i) && @a_hash.delete(i)
      end
    end

    def my_exists(key)
      # key.each do |i|
        @a_hash.has_key?(i)? true : false
    end

    def my_rename(key,new_key)
      @a_hash.has_key?(key) && !@a_hash.has_key?(new_key) && @a_hash[key]= new_key
    end

    def my_show()
      @a_hash
    end

    def backup()
      File.open("my_dump.rdb", "w") {|file| file.write(my_show.inspect) }
    end

      def restore()
        File.open("my_dump.rdb", "r") {|file| @a_hash = eval(file.read)}
      end
end
