class CreatePlacements < ActiveRecord::Migration[7.1]
  def change
    create_table :placements do |t|
      t.string :employment_type
      t.string :status
      t.integer :salary
      t.datetime :start_date
      t.datetime :end_date
      t.references :job, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
