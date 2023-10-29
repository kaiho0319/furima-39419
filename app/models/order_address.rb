class OrderAddress
  include ActiveModel::Model
  attr_accessor :card_information, :month, :day, :postal_code, :shipping_origin_id, :city_ward_or_town, :street_address, :building_name, :phone_number, :user_id, :item_id, :order_id, :token

  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :shipping_origin_id, presence: true, numericality: { other_than: 1 }
  validates :city_ward_or_town, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city_ward_or_town: city_ward_or_town, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end