class AddUserToFileRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :file_records, :user_id, :integer
  end
end
