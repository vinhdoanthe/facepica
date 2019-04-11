class AddTimestampToTables < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :authorized_client, null: true
    add_timestamps :topican, null: true
    add_timestamps :attendance, null: true
  end
end
