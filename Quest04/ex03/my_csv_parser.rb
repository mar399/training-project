require 'pp' #pretty print
# def my_csv_parser(filename,separator)
#     arr = []
#      File.readlines(filename).each do |line|
#          arr << line.chomp.split(separator)
#      end
#   puts arr
# end


# filename = "data.csv"
# pp my_csv_parser(filename, ",")

# Function definition
def my_csv_parser(file, sep = ",") #a function accepts two arguments, a file name separator(which is a comma by defaukt in our case)
    file_data  = File.read(file).split #it reads the  file and split it into elements of an and assigns to a variable
    file_data.each_with_index do |ar, i| #creates an array within the first array and looping through each element
         file_data[i] = ar.split(sep) #looping through and splitting each element with in that array at each index
    end
end
# Sample File
sample_file = "data.csv"
# A call to the function to display the array
pp my_csv_parser(sample_file, ";")