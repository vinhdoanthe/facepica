module HomeHelper
  require 'json'

  def initial?
    file = File.read('~/client.json')
    if file.empty?
      redirect_to new_user_session_path
    else
      # redirect_to
    end
  end
end