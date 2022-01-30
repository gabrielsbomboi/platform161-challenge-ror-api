class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.references :campaign, null: true, foreign_key: true
      t.time :start_at

      t.timestamps
    end
  end
end
