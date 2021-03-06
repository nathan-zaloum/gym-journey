class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.date :date
      t.decimal :weight
      t.text :entry
      t.boolean :gym_attendance
      t.integer :water
      t.integer :calories

      t.timestamps
    end
  end
end
