class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :employment_type
      t.string :status
      t.boolean :is_live
      t.integer :salary
      t.references :client_contact, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
