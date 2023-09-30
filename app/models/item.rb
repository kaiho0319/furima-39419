class Item < ApplicationRecord

  belongs_to :user
  has_one :purchasse

  validatas :
  validatas :product_name, presence: true
  validatas :product_description, presence: true
  validates :category_information_id_id, presence: true, numericality: { other_than: 1 }
  validates :product_condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_days_id, presence: true, numericality: { other_than: 1 }
  validates :region_of_origin_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_information_id
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :shipping_days
  belongs_to :region_of_origin


end
