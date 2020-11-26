FactoryBot.define do
  factory :user_address do
    postal_code { '111-1111' }
    country_id { 2 }
    city { '横浜' }
    address { '青山' }
    building { '柳' }
    phone_number { '08011112222' }
    token { 'aaa' }
  end
end
