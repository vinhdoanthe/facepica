class InitMainTables < ActiveRecord::Migration[5.2]
  def change
    create_table :authorized_client do |t|
      t.string :client_secret
      t.string :client_name
      t.text :location
    end

    create_table :topican do |t|
      t.string :account
      t.string :email
    end

    create_table :attendance do |t|
      t.belongs_to :topican, index: true
      t.belongs_to :authorized_client, index: true
      t.string :type
    end
  end
end
