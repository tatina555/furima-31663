class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :details_category_id,     presence: true
  validates :details_status_id,       presence: true
  validates :delivery_burden_id,      presence: true
  validates :delivery_source_id,      presence: true
  validates :delivery_day_id,         presence: true

  validates :genre_id, numericality: { other_than: 1 } 
end
