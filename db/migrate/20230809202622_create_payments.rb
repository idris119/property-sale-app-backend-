class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :property_id
      t.decimal :amount
      t.string :payment_method
      t.string :customer_name
      t.string :customer_id
      t.string :contact_number
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
