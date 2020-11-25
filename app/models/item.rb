class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :credit

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :details_category
  belongs_to :details_status
  belongs_to :delivery_burden
  belongs_to :delivery_source
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :title
    validates :catch_copy
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :details_category_id
    validates :details_status_id
    validates :delivery_burden_id
    validates :delivery_source_id
    validates :delivery_day_id
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9_999_999
end
