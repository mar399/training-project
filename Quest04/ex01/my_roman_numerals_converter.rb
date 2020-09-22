def roman_numerals(number) #a function that converts numbers to roman numerals from 1-3000
    roman_symbols = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }
      multiplier = number # setting a variable to be equal to our argument value
      symbols=[] #creating an array
      roman_symbols.each do |num, sym| #going through each key and value of the roman_symbols hash
        symbols.push(sym *(multiplier/num)) #adding hash value(which is the roman numeral symbol)multiplied by argument(provided number) divided by the key(which is the ordinary number) to our empty array. Zero x symbol is zero
        multiplier = multiplier % num #after getting a number the line above, which is not sym * 0[nil value in our array] for example sym *2 that multiplier value becomes the remainder of original number divided by num(key in the hash). in this case zero, it wont go any lower and calculate with the remaining values in the hash
      end
      symbols.join #join values in array
    end

     puts roman_numerals(2000)