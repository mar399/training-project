require 'csv'
class MyFirstSelect
    attr_reader :filename_db , :csv
    def initialize(filename_db)
        @filename_db=filename_db
        #  CSV.foreach(filename_db) {|row| puts row.join(",")}

       csv=CSV.foreach(filename_db) do |row|
        row.shift
        # puts row.join(",")
       end
    end
def join(column_on_db_a,filename_db_b,column_on_db_b)
arr=[]
CSV.foreach(@filename_db,:headers=>true).with_index do |row ,i| 
    CSV.foreach(filename_db_b,:headers=>true).with_index do|row2,x| 
      if row.to_h[column_on_db_a] == row2.to_h[column_on_db_b]
        arr << row.to_h.merge(row2.to_h)
      end
    end
  end
      
  #  CSV.foreach(filename_db_b,:headers=>true).with_index do |row2,x| 
  #     row2.to_h
  #     # arr <<
      # p row.to_h[column_on_db_a] 
      # arr << row2.to_h[column_on_db_b]
    # end      

  return arr 
end

        def where(column_name,value)
          arr=[]
          CSV.foreach(@filename_db, :headers=>true).with_index do |row, i|
               p row.to_h if i == 0
                 if row.to_h[column_name] == value
                      arr << row.to_h
                 end
end

          table1 = MyFirstSelect.new("h.csv")
          p table1.join("Player", "i.csv","Name")
 
