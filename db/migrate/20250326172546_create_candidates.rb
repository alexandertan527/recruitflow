class CreateCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :current_job_title
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
