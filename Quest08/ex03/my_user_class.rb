
class Users
    def initialize (database="db.raw")
      @database=database
    end

  def create(user_info)
    data= File.open(@database).to_a
     current_id = !data.empty? ? data.last.split.first.to_i : 0
     current_id +=1

     if user_info.is_a?(Hash)
      File.open(@database, "a+") do |file|
        file.puts "#{current_id}, #{user_info[:firstname]}, #{user_info[:lastname]},#{user_info[:age]},#{user_info[:email]},#{user_info[:password]}" 
        end
      end
      return current_id 
  end

    def get(user_id) 

    file=File.open(@database)
    data = file.readlines.map(&:chomp)
    file.close
    user =[]
     if !data.empty?
      record= data.select {|row| row[0].to_i == user_id}
        if record.size!=0
        user= record.first.split(" , ")
        end
        
     else
        return "Database Empty"
      end
      !user.empty? ? {:id => user[0], :firstname => user[1], :lastname => user[2], :age => user[3], :email => user[4], :password => user[5]} : "Record Not Found"

    end

    def (all)
    file = File.open(@database)
        data = file.readlines.map(&:chomp)
        file.close
        result = []
        if !data.empty?
            data.each do |record|
                user = record.split(',')
                result << {:id => user[0], :firstname => user[1], :lastname => user[2], :age => user[3], :email => user[4], :password => user[5]}
            end
        else
            return "Database Empty"
        end
        return result
    end

  

  def update(user_id,attribute,value)

    file = File.open(@database, 'r+')
        data = file.readlines.map(&:chomp)
        if !data.empty?
            record = data.find { |row| row.split.first.to_i == id}
            user = record != nil ? record.split(',') : []
            if !user.empty?
                i = data.index(record)

                case attribute
                when 'firstname'
                    user[1] = value
                when 'lastname'
                    user[2] = value
                when 'age'
                    user[3] = value
                when 'email'
                    user[4] = value
                when 'password'
                    user[5] = value + "\n"
                else
                    return "Invalid Field"
                end
                data[i] = user.join(',')
                File.open(@database, 'w') do |file|
                    data.each do |record|
                        file.write record
                    end
                end     
               get id
            else
                return "Record Not Found"
            end
        else
            return "Database Empty"
       end
  end
  

    def destroy(id)
      data = File.readlines(@database)
      if !data.empty?
          record = data.find { |row| row.split.first.to_i == id}
          index = data.index(record)
          if index != nil && index >= 0 && data.delete_at(index) 
              File.open(@database, 'w') do |line|
                  data.each do |record|
                      line.write record
                  end
              end
              return "Deleted Successfully"
          else
              return "Record not found"  
          end   
      else
          return "Database Empty"
      end
  end
end



database1=Users.new
 database1.create({:firstname=>"Dahiru", :lastname=>"Mamman", :age=> 24, :password => "daniliya", :email => "mammandahiru@gmail.com"})
 puts database1.get(2)





 