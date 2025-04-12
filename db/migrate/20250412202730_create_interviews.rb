class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.string :type
      t.datetime :interview_date
      t.references :candidate, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
