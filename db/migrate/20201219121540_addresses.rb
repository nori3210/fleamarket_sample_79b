class Addresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer "postal_code"
      t.string "prefecture"
      t.text "city"
      t.text "house_number"
      t.text "building"
      t.integer "telephone"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "user_id"
    end
  end
end
