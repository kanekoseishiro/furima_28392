class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.string :image,              null: false
      t.integer :price,            null: false
      t.text :explanation,         null: false
      t.integer :category_id,         null: false
      t.integer :user_id,          null: false, foreign_key: true
      t.integer :product_status_id,   null: false
      t.integer :shipping_area_id,    null: false
      t.integer :date_of_shipment__id, null: false
      t.integer :delivery_fee_id,     null: false
      t.timestamps
    end
  end
end
