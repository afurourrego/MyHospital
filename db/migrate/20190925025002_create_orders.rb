class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :appointment_id
      t.integer :type_order
      t.text :description

      t.timestamps
    end
  end
end
