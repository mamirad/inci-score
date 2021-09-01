class CreateInciRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :inci_records do |t|
      t.string :product
      t.text :composition
      t.string :score
      t.string :reference
      t.text :unrecognized_inci, array: true, default: []
      t.integer:file_record_id
      t.timestamps
    end
  end
end
