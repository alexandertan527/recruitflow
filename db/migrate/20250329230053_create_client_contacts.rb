class CreateClientContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :client_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :phone_number
      t.string :email
      t.string :status
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
