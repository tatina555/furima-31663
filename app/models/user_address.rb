class UserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :country_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :country_id
  validates :city
  validates :address
  validates :phone_number, format: {with: /\A\d{11}\z/, message: "電話番号はハイフンなしの１１桁です"}
  validates :token
 end

 def save

  credit = Credit.create(user_id: user_id, item_id: item_id)

  StreetAddress.create(postal_code: postal_code, country_id: country_id, city: city, address: address, building: building, phone_number: phone_number, credit_id: credit.id)

 end 
end