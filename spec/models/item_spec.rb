require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    context '商品が出品できる場合' do
      it 'imageとproduct_nameとproduct_descriptionとcategory_information_idとproduct_condition_idとdelivery_charge_idとshipping_days_idとpriceとshipping_origin_idとimageが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_descriptionが空では保存できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_information_idがid1では保存できない' do
        @item.category_information_id = {id: 1}
        @item.valid?
        expect(@item.errors.full_messages).to include("Category information can't be blank")
      end
      it 'item_condition_idがid1では保存できない' do
        @item.item_condition_id = {id: 1}
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'shipping_responsibility_idがid1では保存できない' do
        @item.shipping_responsibility_id = {id: 1}
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping responsibility can't be blank")
      end
      it 'processing_time_idがid1では保存できない' do
        @item.processing_time_id = {id: 1}
        @item.valid?
        expect(@item.errors.full_messages).to include("Processing time can't be blank")
      end
      it 'shipping_origin_idがid1では保存できない' do
        @item.shipping_origin_id = {id: 1}
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下では保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999以上では保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数値以外では保存できない' do
        @item.price = '1000a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
       it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end