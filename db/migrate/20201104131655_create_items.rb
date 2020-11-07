class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :size
      t.string :item_condition
      t.string :postage_payer
      t.string :postage_type
      t.string :prefecture_code
      t.string :estimated_shipping_date
      t.text :item_description
      t.string :trading_status
      t.integer :price
      t.timestamps
    end
  end
end
