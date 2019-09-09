module SessionsHelper

  # Logs in the given admin.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Returns the current logged-in admin (if any).
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