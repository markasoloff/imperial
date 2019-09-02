class SessionsController < ApplicationController
 
 def new
 end

 def create
   admin = Admin.find_by(email: params[:session][:email].downcase)
   if admin && admin.authenticate(params[:session][:password])
     log_in admin
     redirect_to admin
   else
     flash.now[:danger] = 'Invalid email/password combination'
     render 'new'
   end
 end

 def destroy
   log_out
   redirect_to root_url
 end


 # Logs in the given admin.
 def log_in(admin)
   session[:admin_id] = admin.id
 end

 def current_admin
   if session[:admin_id]
     @current_admin ||= Admin.find_by(id: session[:admin_id])
   end
 end

 # Returns true if the user is logged in, false otherwise.
 def logged_in?
   !current_admin.nil?
 end


end
