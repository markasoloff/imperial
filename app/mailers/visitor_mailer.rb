class VisitorMailer < ApplicationMailer
   default from: 'any_from_address@example.com'
   def sample_email(contact)
      @contact = contact
      mail(to: 'blastropodcast@gmail.com', subject: 'This is a test of visitor_mailer.rb')
    end
end
