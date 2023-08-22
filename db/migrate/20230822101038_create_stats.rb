class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.integer :height
      t.integer :weight
      t.integer :appearances
      t.integer :goal_accuracy
      t.integer :goal_5m
      t.integer :goal_h_plus
      t.integer :goal_save
      t.integer :exclusion_conceded
      t.integer :exclusion_success
      t.integer :ratio
      t.references :players, null: false, foreign_key: true

      t.timestamps
    end
  end
end
