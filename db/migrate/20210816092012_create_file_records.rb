class CreateFileRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :file_records do |t|
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
