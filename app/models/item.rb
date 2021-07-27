class Item < ApplicationRecord
  # belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_before_shipping
  belongs_to :shipping_method

  with_options presence: true do
    # 「--」の時は保存できないようにする
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category
      validates :condition
      validates :days_before_shipping
      validates :shipping_method
    end
  end
end
