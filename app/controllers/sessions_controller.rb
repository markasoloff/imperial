class SessionsController < ApplicationController
 
def create
   admin = Admin.find_by(email: params[:email])
   if admin && admin.authenticate(params[:password])
     jwt = JWT.encode(
       {
        admin_id: admin.id, # the data to encode
        exp: 24.hours.from_now.to_i # the expiration time
        },
        "butterscotch", # the secret key
        'HS256' # the encryption algorithm
     )
     render json: {jwt: jwt, email: admin.email, admin_id: admin.id}, status: :created
   else
     render json: {}, status: :unauthorized
   end
 end



 def new
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
