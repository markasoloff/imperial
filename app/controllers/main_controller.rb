class MainController < ApplicationController

  before_action :authenticate_admin, except: [:index]

  def index
    render "/index.html.erb"
  end


end
