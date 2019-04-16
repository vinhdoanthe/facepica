class HomeController < ApplicationController
  # require 'json'

  before_action :client_initialied!

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
    else

      redirect_to authorized_clients_path
    end
  end
end