class Email
    attr_accessor :subject ,:date,:from
    def initialize(subject,date,from)
        @subject=subject 
        @date=date
        @from=from
    end
end
email=Email.new("homework", "2014-12-01","Ferdous")
puts email.date