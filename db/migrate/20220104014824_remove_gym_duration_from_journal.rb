class RemoveGymDurationFromJournal < ActiveRecord::Migration[7.0]
  def change
    remove_column :journals, :gym_duration, :time
  end
end
