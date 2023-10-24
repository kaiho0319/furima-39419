class Address < ApplicationRecord

  belongs_to :order


  # validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  # validates :shipping_origin_id, presence: true
  # validates :city_ward_or_town, presence: true
  # validates :street_address, presence: true
  # validates :building_name, exclusion: { in: [nil] }
  # validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }


end
