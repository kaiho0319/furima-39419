require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    context '商品が出品できる場合' do
      it 'contentとimageが存在していれば保存できる' do

      end
      it 'contentが空でも保存できる' do

      end
      it 'imageが空でも保存できる' do

      end
    end
    context '商品が出品できない場合' do
      it 'contentとimageが空では保存できない' do

      end
      it 'roomが紐付いていないと保存できない' do

      end
      it 'userが紐付いていないと保存できない' do

      end
    end
  end
end