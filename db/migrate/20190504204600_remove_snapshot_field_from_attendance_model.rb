class RemoveSnapshotFieldFromAttendanceModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :attendance, :snapshot
  end
end
