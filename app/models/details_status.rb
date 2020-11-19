class DetailsStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カテゴリ' },
    { id: 3, name: '商品の状態' },
    { id: 4, name: '配送料の負担' },
    { id: 5, name: '発送元の地域' },
    { id: 6, name: '発送前の日数' },
  ]

  include ActiveHash::Associations
  has_many :items
end
