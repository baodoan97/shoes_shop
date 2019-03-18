class WelcomeMailer < ApplicationMailer
    def welcome_send(admins)
        @admins = admins
        mail to: admins.email, subjuct: 'Welcome ',from: "adminbinh@vinova.sg" 
    
    end
end