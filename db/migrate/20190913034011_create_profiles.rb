class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :identification_card, unique: true
      t.string :email
      t.date :birthday
      t.integer :eps
      t.string :full_name, null: false
      t.string :address
      t.string :city
      t.integer :arl
      t.integer :rh, null: false
      t.string :phone, null: false
      t.text :allergies
      t.string :disability
      t.text :notes

      t.timestamps
    end
  end
end
