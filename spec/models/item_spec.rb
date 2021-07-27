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











      # it 'passwordが英数6文字以上であれば登録できること' do
      #   @user.password = 'aaa111'
      #   @user.password_confirmation = 'aaa111'
      #   expect(@user).to be_valid
      # end
    end

    # context '保存できない場合' do
    #   it 'nicknameが空では登録できないこと' do
    #     @user.nickname = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname can't be blank")
    #   end

    #   it '重複したnicknameが存在する場合登録できないこと' do
    #     @user.save
    #     another_user = FactoryBot.build(:user, nickname: @user.nickname)
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    #   end

    #   it 'emailが空では登録できないこと' do
    #     @user.email = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email can't be blank")
    #   end

    #   it 'emailに@が含まれていない場合、登録できないこと' do
    #     @user.email = 'aaahotmail.co.jp'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Email is invalid')
    #   end

    #   it '重複したemailが存在する場合登録できないこと' do
    #     @user.save
    #     another_user = FactoryBot.build(:user, email: @user.email)
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include('Email has already been taken')
    #   end

    #   it 'passwordが空では登録できないこと' do
    #     @user.password = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password can't be blank")
    #   end

    #   it 'passwordが英数5文字以下であれば登録できないこと' do
    #     @user.password = 'aaa11'
    #     @user.password_confirmation = 'aaa11'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    #   end

    #   it 'passwordが英字のみでは登録できないこと' do
    #     @user.password = 'aaaaaa'
    #     @user.password_confirmation = 'aaaaaa'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    #   end

    #   it 'passwordが数字のみでは登録できないこと' do
    #     @user.password = '111111'
    #     @user.password_confirmation = '111111'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    #   end

    #   it 'passwordが全角文字では登録できないこと' do
    #     @user.password = 'ぱすわーど'
    #     @user.password_confirmation = 'ぱすわーど'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    #   end

    #   it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    #     @user.password = 'aaa111'
    #     @user.password_confirmation = 'bbb222'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    #   end

    #   it 'birthdateが空では登録できないこと' do
    #     @user.birthdate = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Birthdate can't be blank")
    #   end

    #   it 'first_nameが空では登録できないこと' do
    #     @user.first_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name can't be blank")
    #   end

    #   it 'first_nameが半角では登録できないこと' do
    #     @user.first_name = 'taro'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
    #   end

    #   it 'last_nameが空では登録できないこと' do
    #     @user.last_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name can't be blank")
    #   end

    #   it 'last_nameが半角では登録できないこと' do
    #     @user.last_name = 'tanaka'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
    #   end

    #   it 'first_name_kanaが空では登録できないこと' do
    #     @user.first_name_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name kana can't be blank")
    #   end

    #   it 'first_name_kanaが平仮名では登録できないこと' do
    #     @user.first_name_kana = 'たろう'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
    #   end

    #   it 'last_name_kanaが空では登録できないこと' do
    #     @user.last_name_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    #   end

    #   it 'last_name_kanaが平仮名では登録できないこと' do
    #     @user.last_name_kana = 'たなか'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
    #   end
    # end
  end
end
