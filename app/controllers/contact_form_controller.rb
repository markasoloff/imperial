class ContactFormController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save

        # Sends email to contact when contact is created.
        VisitorMailer.sample_email(@contact).deliver

        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
 
end
