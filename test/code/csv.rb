require 'csv'
def my_csv_parser(string, separator)
  file= CSV.parse(string, :col_sep => separator)

     return file
end
colors= "green\nred,blue"
p my_csv_parser(colors,",")

