class AdminsController < ApplicationController

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

    # def authenticate_admin
    #   unless current_admin
    #     render json: {}, status: :unauthorized
    #   end
    # end


  # def create
  #   admin = Admin.new(
  #     name: params[:name],
  #     email: params[:email],
  #     password: params[:password],
  #     password_confirmation: params[:password_confirmation]
  #   )

  #   if admin.save
  #     render json: {message: 'Admin created successfully'}, status: :created
  #   else
  #     render json: {errors: admin.errors.full_messages}, status: :bad_request
  #   end
  # end


    #not a standard show action
  # def login
  #   if current_admin
  #   # render "login.html"
  #     render "admins/cms.html"
  #   else render json: {}
  #   end
  # end

end
