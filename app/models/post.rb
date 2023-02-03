class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category 
  has_many :likes, dependent: :destroy
  validates :title, :presence => true
  validates :description, :presence => true
end
