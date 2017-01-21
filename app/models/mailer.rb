class Mailer
    attr_accessor :gmail, :body, :send_to
    def initialize(username, password)
        @gmail = Gmail.connect(username, password)
    end
  
    def self.read_and_reply(un,pw)
      new_mail = self.new(un,pw)
      new_mail.gmail.inbox.find(:unread).each do |email|
            email.set_recipient
            email.respond_to_email
        end
    end
    
    def read_body
        self.text_part.body.decoded.strip
    end 
    
    def respond_to_email
        case self.read_body
        when '1'
          self.compose_email('subject 1', 'Response to 1')
        when '2'
          self.compose_email('subject 2', 'Response to 2')
        else
          self.compose_email('subject 3', 'Response to something')
        end
    end
    
    def set_recipient
        sender = JSON.parse(self.from.to_json).first
        email = sender["host"]
        user_name = sender["mailbox"]
        @send_to = sender+"@"+email
    end
    
    def compose_email(subj, bod)
        email = @gmail.compose do
         to self.send_to
         subject subj
        body bod
        end
        email.deliver! # or: gmail.deliver(email)
    end 
end

# @gmail.inbox.emails.last.text_part.body.decoded
# JSON.parse(@gmail.inbox.emails.last.from.to_json).first["host"]
#Mailer.read_and_reply('fidutysupp@gmail.com', 'Fiduty123')