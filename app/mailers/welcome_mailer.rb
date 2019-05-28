class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail to: @user.email, subjuct: 'Welcome to N-Air Shop',from: "quoctienphamm@gmail.com"    
    end
end