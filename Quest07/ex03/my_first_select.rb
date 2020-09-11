require 'csv'
class MyFirstSelect
    attr_reader :filename_db , :csv
    def initialize(filename_db)
        @filename_db=filename_db
        #  CSV.foreach(filename_db) {|row| puts row.join(",")}

       csv=CSV.read(filename_db, skip_lines: /^(?:,\s*)+$/)

         csv.each do |row| 
        row.shift
        # puts row.join(",")
         end
        
    end 

    def where(column_name,value)
            arr=[]
            CSV.foreach(@filename_db, :headers=>true).with_index do |row, i|
                 p row.to_h if i == 0
                   if row.to_h[column_name] == value
                        arr << row.to_h
                   end
                #  if row.field?(column_name)&& row.field?(value)
                #     arr << row.to_h
                #  end
            end
            return arr
            # csvs.each do |row| puts row.inspect  
        
            #  row.field?("column_name")&& row.field?("values")
            #     #   row.each do |lines| 
            #         return row.inspect
            #         # >> arr
                  
            # end
            #  column_name.has_key?(header): 
            #     # row.each do |x|
            #     return row.inspect
        # end
    
    end


        #  row.field(:column_name) =="value"
       
        # puts "#{column_name} => #{value}"
      
 
end

table1 =MyFirstSelect.new("h.csv")
p table1.where("Player", "Joe Holland")
 

