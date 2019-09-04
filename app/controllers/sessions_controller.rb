class SessionsController < ApplicationController
 
def create
   admin = Admin.find_by(email: params[:email])
   if admin && admin.authenticate(params[:password])
     jwt = JWT.encode(
       {
        admin_id: admin.id, # the data to encode
        # exp: 24.hours.from_now.to_i # the expiration time
        },
        "butterscotch", # the secret key
        'HS256' # the encryption algorithm
     )
     session[:admin_id] = admin.id
     redirect_to root_url, notice: "Logged in!"
     # render json: {jwt: jwt, email: admin.email, admin_id: admin.id}, status: :created
   else
     render json: {Error: "Unauthorized password and/or email" }, status: :unauthorized
   end
 end


 def current_admin
     auth_headers = request.headers['Authorization']
     if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
       token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
       begin
         decoded_token = JWT.decode(
           token,
           Rails.application.credentials.fetch(:secret_key_base),
           true,
           { algorithm: 'HS256' }
         )
         Admin.find_by(id: decoded_token[0]["admin_id"])
       rescue JWT::ExpiredSignature
         nil
     else
       flash.now[:danger] = 'Invalid email/password combination'
       end
     end
 end

   helper_method :current_admin

   def authenticate_admin
     unless current_admin
       render json: {}, status: :unauthorized
     end
   end

   #not a standard show action
 def show
   # render "login.html"
   render "admins/cms.html"
 end


 def new
 end

 def destroy
   session[:admin_id] = nil
   redirect_to '/', notice: 'Logged out!'
 end


 # Logs in the given admin.
 def log_in(admin)
   session[:admin_id] = admin.id
 end

 # def current_admin
 #   if session[:admin_id]
 #     @current_admin ||= Admin.find_by(id: session[:admin_id])
 #   end
 # end

 # Returns true if the user is logged in, false otherwise.
 def logged_in?
   !current_admin.nil?
 end


end
