def roman_numerals(number)
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
      multiplier = number
      symbols=[]
      roman.each do |num, sym|
        symbols.push(sym *(multiplier/num))
        multiplier = multiplier % num
      end
      symbols.join
    end