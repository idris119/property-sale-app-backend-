class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :status
      t.decimal :amount
      t.string :reference

      t.timestamps
    end
  end
end
