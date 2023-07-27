class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :image_url
      t.string :seller_contact

      t.timestamps
    end
  end
end
