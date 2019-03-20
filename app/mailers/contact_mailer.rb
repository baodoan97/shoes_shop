class ContactMailer < ActionMailer::Base
    default to: "admitestn@vinova.sg"
   
    def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    
    # mail(from: email, subject: 'Vinova Contact Form Message')
    end
   end