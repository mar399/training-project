class Email
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
class Mailbox
    def initialize(name,emails)
        @name=name
        @emails=emails
    end

    def name
        @name
    end
    def emails
        @emails
    end
end

class MailboxTextFormatter

end