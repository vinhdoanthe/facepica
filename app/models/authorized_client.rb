class AuthorizedClient < ApplicationRecord
  require 'securerandom'

  self.table_name = 'authorized_client'

  def self.generate_client_secret
    SecureRandom.base64(64)
  end
end