class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image


  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_information_id, presence: true, numericality: { other_than: 1 }
  validates :item_condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_responsibility_id, presence: true, numericality: { other_than: 1 }
  validates :processing_time_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_origin_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_information
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :shipping_days
  belongs_to :region_of_origin


end
