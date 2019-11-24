class MainController < ApplicationController

  before_action :authenticate_admin, except: [:index]

  def index
    # @contact = Contact.last
    # @contacts = Contact.all
    
    render "/index.html.erb"
  end


end
