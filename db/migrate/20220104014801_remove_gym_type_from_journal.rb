class RemoveGymTypeFromJournal < ActiveRecord::Migration[7.0]
  def change
    remove_column :journals, :gym_type, :string
  end
end
