class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_method
  belongs_to :prefecture
  belongs_to :days_before_shipping

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text
    # 「--」の時は保存できないようにする
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_method_id
      validates :prefecture_id
      validates :days_before_shipping_id
    end
    with_options format: { with: /\A[0-9]+\z/} do
      with_options numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} do
        validates :price
      end
    end
  end
end
