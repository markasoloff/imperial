class MainController < ApplicationController

  before_action :authenticate_admin, except: [:index, :services]

  def index
    # @contact = Contact.last
    # @contacts = Contact.all
    
    render "/index.html.erb"
  end

  def systems
    render "/systems.html.erb"
  end

  def cyber
    render "/cyber.html.erb"
  end

  def control
    render "/control.html.erb"
  end

  def c4isr
    render "/c4isr.html.erb"
  end

  def rf
    render "/rf.html.erb"
  end

  def services
    render "/services.html.erb"
  end



end
