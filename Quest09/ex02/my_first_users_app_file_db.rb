require 'PP'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
​
​
enable :sessions 
set :bind, '0.0.0.0'
set :port, 8080
​
class User
​
    @@user = Hash.new
    @@database = 'db.raw'
​
    def self.save(user_info)
        data = File.readlines(@@database)
        if !data.empty? 
            curr_id = eval(data.last)['id'].to_i
        else
            curr_id = 0
        end
        curr_id += 1
        if user_info.is_a?(Hash) 
            File.open(@@database, 'a+') do |file|
                new_user = {'id' => curr_id}.merge(user_info)
                file.puts new_user.to_s
                file.close
            end
            return curr_id
        else
            return nil
        end 
    end
​
    def self.get(id)
        file = File.open(@@database)
        data = file.readlines.map(&:chomp)
        file.close
        if !data.empty?
             record = data.select { |row| eval(row)['id'].to_i == id }
             if record.size != 0
                @@user = eval(record[0])
             end
        else
            return "Database Empty"
        end
        !@@user.empty? ? @@user : "Record Not Found"
    end
​
    def self.get_with_email_password(email, password)
        file = File.open(@@database)
        data = file.readlines.map(&:chomp)
        file.close
        if !data.empty?
             record = data.find { |row| eval(row)['email'].to_s == email && eval(row)['password'].to_s == password }
             @@user = eval(record) if record != nil
        end
        !@@user.empty? ? @@user : {}
    end
​
    def self.all()
        file = File.open(@@database)
        data = file.readlines.map(&:chomp)
        file.close
        result = []
        if !data.empty?
            data.each do |record|
                user = eval(record)
                result << user
            end
        else
            return "Database Empty"
        end
        return result
    end
​
    def self.all_without_password()
        file = File.open(@@database)
        data = file.readlines.map(&:chomp)
        file.close
        result = []
        if !data.empty?
            data.each do |record|
                record = eval(record)
                record.delete('password')
                result << record
            end
        else
            return "Database Empty"
        end
        return result
    end
​
    def self.update(id, attr, val)
        file = File.open(@@database, 'r+')
        data = file.readlines.map(&:chomp)
        if !data.empty?
            record = data.find { |row| eval(row)['id'].to_i == id}
            user = record != nil ? eval(record) : []
            if !user.empty?
                i = data.index(record.to_s)
                case attr
                when 'firstname'
                    user['firstname'] = val
                when 'lastname'
                    user['lastname'] = val
                when 'age'
                    user['age'] = val
                when 'email'
                    user['email'] = val
                when 'password'
                    user['password'] = val
                else
                    return "Invalid Field"
                end
                data[i] = user.to_s
                File.open(@@database, 'w') do |file|
                    data.each_with_index do |record, i|
                        file.write record + "\n"
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
    def self.destroy(id)
        data = File.readlines(@@database)
        if !data.empty?
            record = data.find { |row| eval(row)['id'] == id}
            index = data.index(record)
            if index != nil && index >= 0
                data.delete_at(index)
                File.open(@@database, 'w') do |file|
                    !data.empty? && file.puts(data)
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
post '/users' do
    User.save(params) && "User Saved Successfully"
end
​
get '/users' do
    users = User.all_without_password()
    users.to_json
end
​
post '/sign_in' do
    email = params[:email]
    password = params[:password]
    user = User.get_with_email_password(email, password)
    if !user.empty?
        session[:user_id] = user['id']
        "User Logged In Successfully"
    else
        "User Not Available"
    end
end
​
put '/users' do
    if session[:user_id] 
        User.update(session[:user_id], 'password', params[:new_password])
        return User.get(session[:user_id]).to_json
    else
        return "Unauthorized Access: Please Login in"  
    end
end
​
delete '/sign_out' do
    session.clear && "User is logged out"
end
​
delete '/users' do
    return User.destroy(session[:user_id]) if session[:user_id] != nil
    return "User NOT in Session"
end
​















