class AttendanceController < HomeController

  before_action :client_initialied!, only: [:new]

  def new

  end

  def index

  end

  def client_initialied!
    @client_secret = cookies[:client_secret]
    if (@client_secret.nil?)
      if current_user.nil?
        redirect_to new_user_session_path
      else
        redirect_to new_authorized_client_path
      end
    end
  end
end