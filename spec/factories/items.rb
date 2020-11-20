FactoryBot.define do
  factory :item do
    association :user
    title                   { 'あああ' }
    catch_copy              { 'テスト' }
    details_category_id     { 2 }
    details_status_id       { 2 }
    delivery_burden_id      { 2 }
    delivery_source_id      { 2 }
    delivery_day_id         { 2 }
    price                   { 500 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
