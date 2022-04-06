class RenameOldTableToNew < ActiveRecord::Migration[7.0]
  def change
    rename_table :loaves, :breads
  end
end
