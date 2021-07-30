require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '配送情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      purchase_record = FactoryBot.create(:purchase_record, user_id:user.id,item_id:item.id)
      @shipping_address = FactoryBot.build(:shipping_address, purchase_record_id: purchase_record.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @shipping_address.building_name = ''
        expect(@shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @shipping_address.postal_code = ''
        @shipping_address.valid?
        binding.pry
        expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")

      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shipping_address.postal_code = '1234567'
        @shipping_address.valid?
        # binding.pry
        expect(@shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @shipping_address.prefecture_id = 0
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @shipping_address.municipality = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @shipping_address.house_number = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @shipping_address.phone_number = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @shipping_address.phone_number = '１１１１１１１１１１１'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end