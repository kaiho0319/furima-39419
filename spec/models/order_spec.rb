require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'クレジットカード情報の保存' do
    before do
      address = FactoryBot.create(:address)
      @order = FactoryBot.build(:order, address_id: address.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'card_informationが空だと保存できないこと' do
        @order.card_information = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Card information can't be blank")
      end
      it 'card_informationが半角英数字でないと保存できないこと' do
        @order.card_information = 'あ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Card information can't be blank")
      end
      it 'monthが空だと保存できないこと' do
        @order.month = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Month can't be blank")
      end
      it 'dayが空だと保存できないこと' do
        @order.day = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Day can't be blank")
      end
      it 'security_codeが空では保存できないこと' do
        @order.security_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Security code can't be blank")
      end
      it 'security_codeが4桁もしくは3桁以外では保存できないこと' do
        @order.security_code = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Security code can't be blank")
      end
      it 'addressが紐付いていないと保存できないこと' do
        @order.address_id = 'nil'
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
    end
  end
end

