class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.integer :person_id

      t.timestamps
    end
  end
end
