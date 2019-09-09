class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper

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
        end
      end
  end

    helper_method :current_admin

    def authenticate_admin
      unless current_admin
        render json: {}, status: :unauthorized
      end
    end
end
