class HomeController < ApplicationController
  require 'json'

  before_action :client_initialied!

  def index

  end

  def client_initialied!
    begin
      file = File.read('~/client.json')
      client_info = JSON.parse(file)
      client_id = client_info['id']
      client_name = client_info['client_name']
      client_secret = client_info['client_secret']
      file.close
    rescue
      if current_user.nil?
        redirect_to new_user_session_path
      else
        redirect_to new_authorized_clients_path
      end
    end
  end
end