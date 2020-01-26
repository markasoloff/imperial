class MainController < ApplicationController

  before_action :authenticate_admin, except: [:index, :services]

  def index
    # @contact = Contact.last
    # @contacts = Contact.all
    
    render "/index.html.erb"
  end

  def services
    render "/services.html.erb"
  end


end
