class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :details_category
  belongs_to :details_status
  belongs_to :delivery_burden
  belongs_to :delivery_source
  belongs_to :delivery_day

  validates :details_category_id,     presence: true
  validates :details_status_id,       presence: true
  validates :delivery_burden_id,      presence: true
  validates :delivery_source_id,      presence: true
  validates :delivery_day_id,         presence: true

  validates :details_category_id, numericality: { other_than: 1 } 
  validates :details_status_id, numericality: { other_than: 1 } 
  validates :delivery_burden_id, numericality: { other_than: 1 } 
  validates :delivery_source_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 

end
