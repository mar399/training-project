require "readline"
  def my_cli
    begin
        input = Readline.readline('>', true)
        arr = input.split
        until arr[0] == "exit"
          p arr
          input = Readline.readline('>', true) 
          arr = input.split
        end
        puts "Goodbye"
    rescue Interrupt => e
        puts e
        exit
    end
  end
     puts my_cli()