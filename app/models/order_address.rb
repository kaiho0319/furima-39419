class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city_ward_or_town, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :shipping_origin_id, numericality: { other_than: 1 }
    validates :city_ward_or_town
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city_ward_or_town: city_ward_or_town, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end