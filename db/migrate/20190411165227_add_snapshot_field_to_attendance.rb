class AddSnapshotFieldToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance, :snapshot, :string
  end
end
