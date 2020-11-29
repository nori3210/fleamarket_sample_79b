class Item < ApplicationRecord
  validates :name, length: { in: 1..40 }
  validates :item_description, length: { in: 1..1000 }

  with_options presence: true do
    validates :category
    validates :size_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :postage_type_id
    validates :prefecture_id
    validates :estimated_shipping_date_id
    validates :price
    validates :trading_status
  end
  belongs_to :category
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

end
