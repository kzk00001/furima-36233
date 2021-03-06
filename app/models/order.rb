class Order
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number,
                :item_id, :user_id

  include ActiveModel::Model

  with_options presence: true do
    validates :token
    validates :municipality
    validates :house_number
    validates :item_id
    validates :user_id
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :prefecture_id
    end
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' } do
      validates :postal_code
    end
    with_options format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' } do
      with_options length: { in: 10..11 } do
        validates :phone_number
      end
    end
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                           house_number: house_number, building_name: building_name, purchase_record_id: purchase_record.id)
  end
end
