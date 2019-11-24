# class ContactsController < ApplicationController
 
#  def new
#    @contact = Contact.new
#  end

#  def create
#    begin
#      @contact = Contact.new(contact_params)
#      @contact.request = request
#      if @contact.deliver
#        flash.now[:error] = nil
#      else
#        flash.now[:notice] = 'Cannot send message.'
#        render :new
#      end
#    rescue ScriptError
#      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
#    end
#  end

#   private

#    def contact_params
#      params.require(:contact).permit(:name, :email, :body)
#    end
# end
