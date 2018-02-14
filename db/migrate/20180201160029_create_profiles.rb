class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :person_id
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
