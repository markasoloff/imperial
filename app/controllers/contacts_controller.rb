class ContactsController < ApplicationController
 
 def new
   @contact = Contact.new
 end

 def create
   begin
     @contact = Contact.new(params[:contact])
     @contact.request = request
     if @contact.deliver
       flash.now[:notice] = 'Thank you for your message!'
     else
       # render :new
       flash.now[:notice] = 'Something went wrong. Message not sent.'
     end
   rescue ScriptError
     flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
   end
 end

  def edit
    @contact = Contact.find(params[:id])
  end


  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  private

   def contact_params
     params.require(:contact).permit(:name, :email, :body)
   end
end
