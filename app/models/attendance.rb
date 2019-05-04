class Attendance < ApplicationRecord
  self.table_name = 'attendance'
  require 'aws-sdk'
  require 'dotenv'
  Dotenv.load

  has_one_base64_attached :snapshot
  belongs_to :authorized_client, optional: true
  belongs_to :topican, optional: true

  def recognize

  end
end