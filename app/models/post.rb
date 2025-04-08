class Post < ApplicationRecord
  has_many :comments
  has_many :votes
  validates :title, presence: true
  validates :post_type, presence: true
  validates :score, presence: true
  validates :url, presence: true
  validates :by, presence: true
end
