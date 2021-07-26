class Item < ApplicationRecord
  # validates :product_name,       presence: true
  # validates :text,  presence: true
  # validates :price,     presence: true
  # 空の投稿を保存できないようにする
  # validates :title, :text, presence: true

  # belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_method

  # 「--」の時は保存できないようにする
  validates :shipping_method_id, numericality: { other_than: 0, message: "can't be blank" }
end
