class Item < ApplicationRecord
  validates :name, length: { in: 1..40 }
  validates :item_description, length: { in: 1..1000 }

  with_options presence: true do
    validates :category_id
    validates :size
    validates :item_condition
    validates :postage_payer
    validates :postage_type
    validates :prefecture_code
    validates :estimated_shipping_date
    validates :price
    validates :trading_status
  end
end
