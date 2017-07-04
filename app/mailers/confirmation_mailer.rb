class ConfirmationMailer < ApplicationMailer
    default from: "lew.vine@gmail.com"
    
    def confirmation_instructions(user)
        @user = user
        mail(to: user.email, subject: "Confirmation E-Mail for #{user.email}")
    end
    
end
