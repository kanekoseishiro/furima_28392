class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture,                  null: false
      t.string :city,           default: ""
      t.string :house_number,   default: ""
      t.string :building_name,  default: ""
      t.string :phone_number,                 null: false
      t.integer :purchase_id,              null: false,  foreign_key: true
      t.timestamps
    end
  end
end
