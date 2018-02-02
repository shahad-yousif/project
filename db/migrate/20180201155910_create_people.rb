class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :date_of_birth
      t.string :phone_number
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
