class CreateTravelProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :travel_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :hobbies
      t.string :travel_style
      t.string :budget_range
      t.string :trip_length_preference
      t.text :destinations_interested
      t.string :adventure_level

      t.timestamps
    end
  end
end
