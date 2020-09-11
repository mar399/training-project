def hamming_dna(dna_1, dna_2)
    c = dna_1.zip(dna_2).count{|a,b| a !=b}
    return c
    
#   puts dna_match.each{|x|}
        # if x != y 
            # dna_match.push(x)
        
end


dna_1 =[2,3,4,5]
dna_2= [2,3,1,1]
# dna_match=Array.new()
# dna_match.push(x,y)
# return dna_match.length         
# puts dna_match
puts hamming_dna(dna_1, dna_2)