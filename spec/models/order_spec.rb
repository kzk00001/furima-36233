require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '配送情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
      # Mysql2::Error: MySQL client is not connected が出るため
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'Userが紐付いていないと登録できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'Itemが紐づいていないと登録できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10文字を下回ると保存できないこと' do
        @order.phone_number = '111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it 'phone_numberが12文字を上回ると保存できないこと' do
        @order.phone_number = '11111111111111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @order.phone_number = '１１１１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'phone_numberが半角英字だと保存できないこと' do
        @order.phone_number = 'aaaaaaaaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'phone_numberが半角英数字混合だと保存できないこと' do
        @order.phone_number = 'aaaaa11111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'phone_numberがハイフンありだと保存できないこと' do
        @order.phone_number = '11111-11111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
