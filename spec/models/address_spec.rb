require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'ユーザー情報登録' do
    before do
      @address = FactoryBot.build(:address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列のみでないと保存できないこと' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'shipping_origin_idがid1では保存できないこと' do
        @address.shipping_origin_id = {id: 1}
        @address.valid?
        expect(@address.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it 'city_ward_or_townが空だと保存できないこと' do
        @address.city_ward_or_town = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City ward or town can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @address.street_address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでないと保存できないこと' do
        @address.phone_number = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
