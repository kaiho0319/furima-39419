class Item < ApplicationRecord

  belongs_to :user
  has_one :purchasse

  validatas :
  validates :category_information_id_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_information_id
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :shipping_days
  belongs_to :region_of_origin


end
