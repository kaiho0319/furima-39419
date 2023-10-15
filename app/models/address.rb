class Address < ApplicationRecord
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :shipping_origin_id, presence: true
  validates :city_ward_or_town, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end
