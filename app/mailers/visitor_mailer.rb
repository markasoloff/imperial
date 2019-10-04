class VisitorMailer < ApplicationMailer
   default from: 'notifications@example.com'
   
    def contact_email
      # @user = params[:user]
      # @url  = 'http://example.com/login'
      mail(to: 'blastropodcast@gmail.com', subject: 'test')
    end
end
