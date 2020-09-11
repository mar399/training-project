class Email
    attr_accessor :subject ,:date,:from
    def initialize(subject,headers)
        @subject=subject 
       @headers=headers
    end

    def subject
        @subject
    end
    def date
        @headers[:date]
    end

    def from
        @headers[:from]
    end
end

email=Email.new("homework", {:date=>"2014-12-01",:from =>"Ferdous"})
puts email