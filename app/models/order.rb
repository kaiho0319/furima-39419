class Order
  include ActiveModel::Model
  attr_accessor :token, :card_information, :month, :day, :security_code

  validates :card_information, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validates :security_code, presence: true
  validates :token, presence: true

  def save
    order = Order.create(card_information: card_information, month: month, day: day, security_code: security_code, token: token)
    address.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city_ward_or_town: city_ward_or_town, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end