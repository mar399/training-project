def my_cat(*name_of_file)
    if !name_of_file.empty?
        name_of_file.each do |file|
        fl = File.open(file)
        puts fl.read
       end
    else 
        puts "No file name entered"
    end
end

my_cat("cat.rb")