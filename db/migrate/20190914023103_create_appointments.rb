class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :creator_id
      t.integer :doctor_id
      t.integer :patient_id
      t.text :diagnostic
      t.boolean :assistance

      t.timestamps
    end
  end
end
