def my_cat(*name_of_file) #defining a function that takes name(s) of file(s)
    if !name_of_file.empty? #checking to see if name of atleast one file is entered
        name_of_file.each do |file| #looping through each filename
        fl = File.open(file) #opening files
        puts fl.read #reading files contents
       end
    else 
        puts "No file name entered"
    end
end

my_cat("cat.rb", "2nd.rb")