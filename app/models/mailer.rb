class Mailer
    attr_accessor :body, :send_to, :email
    def initialize(email)
        self.email = email
        self.set_recipient
        self.respond_to_email
    end
  
    def self.read_and_reply(username, password)
      @@gmail = Gmail.connect(username, password)
      @@gmail.inbox.find(:unread).each do |email|
            Mailer.new(email)
            email.read!
        end
    end
    
    def read_body
        # self.email.text_part.body.decoded.strip
        self.email.text_part.body.as_json["raw_source"].first
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
        sender = JSON.parse(self.email.from.to_json).first
        email = sender["host"]
        user_name = sender["mailbox"]
        self.send_to = "#{user_name}@#{email}"
    end
    
    def compose_email(subj, bod)
        sender = self.send_to
        email = @@gmail.compose do
         to sender
         subject subj
        body bod
        end
        email.deliver! # or: gmail.deliver(email)
    end 
end

# @gmail.inbox.emails.last.text_part.body.decoded
# JSON.parse(@gmail.inbox.emails.last.from.to_json).first["host"]
#Mailer.read_and_reply('fidutysupp@gmail.com', 'Fiduty123')
