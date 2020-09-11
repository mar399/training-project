require 'pp'
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
def my_csv_parser(file, sep = ",")
    file_data  = File.read(file).split
    file_data.each_with_index do |ar, i|
         file_data[i] = ar.split(sep)
    end
end
# Sample File
sample_file = "data.csv"
# A call to the function to display the array
pp my_csv_parser(sample_file, ";")