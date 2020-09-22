require 'PP'
​
class User 
​
    def initialize database = 'db.raw'
        @database = database
    end
​
    def create(user_info)
        data = File.open(@database).to_a
        curr_id = !data.empty? ? data.last.split.first.to_i : 0
        curr_id += 1
        if user_info.is_a?(Hash) 
            File.open(@database, 'a+') do |file|
                file.puts "#{curr_id},#{user_info[:firstname]},#{user_info[:lastname]},#{user_info[:age]},#{user_info[:email]},#{user_info[:password]}"
            end
            return curr_id
        else
            return nil
        end 
    end
​
    def get(id)
        file = File.open(@database)
        data = file.readlines.map(&:chomp)
        file.close
        user = []
        if !data.empty?
             record = data.select { |row| row[0].to_i == id }
             if record.size != 0
                user = record.first.split(',')
             end
        else
            return "Database Empty"
        end
        !user.empty? ? {:id => user[0], :firstname => user[1], :lastname => user[2], :age => user[3], :email => user[4], :password => user[5]} : "Record Not Found"
    end
​
    def all()
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
​
    def update(id, attr, val)
        file = File.open(@database, 'r+')
        data = file.readlines.map(&:chomp)
        if !data.empty?
            record = data.find { |row| row.split.first.to_i == id}
            user = record != nil ? record.split(',') : []
            if !user.empty?
                i = data.index(record)
                case attr
                when 'firstname'
                    user[1] = val
                when 'lastname'
                    user[2] = val
                when 'age'
                    user[3] = val
                when 'email'
                    user[4] = val
                when 'password'
                    user[5] = val + "\n"
                else
                    return "Invalid Field"
                end
                data[i] = user.join(',')
                File.open(@database, 'w') do |line|
                    data.each do |record|
                        line.write record
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
​
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
​
test_user = {
    :firstname => "James",
    :lastname => "McNaugh",
    :age => "38",
    :email => "james@example.com",
    :password => "password"
}
user = User.new()
puts user.create(test_user);
puts user.get(5)
# pp user.all()
pp user.update(2, 'test', 'Ibrahim')
pp user.destroy(17)
Shared in