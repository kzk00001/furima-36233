require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '保存できる場合' do
      it '項目を適切に入力すれば商品を登録できること' do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it '商品画像が空では登録できないこと' do
        @item.image = nil
        @item.image.attached?
      end

      it 'product_nameが空では登録できないこと' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "product_nameが40文字を超えると登録できないこと" do
        @item.product_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
      end

      it 'textが空では登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "textが1000文字を超えると登録できないこと" do
        @item.text = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では登録できないこと' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'Shipping_method_idが空では登録できないこと' do
        @item.shipping_method_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping method can't be blank")
      end

      it 'prefecture_idが空では登録できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'days_before_shipping_idが空では登録できないこと' do
        @item.days_before_shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days before shipping can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300を下回ると登録できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999を超えると登録できないこと' do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
