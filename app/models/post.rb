class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category , class_name: "Category"
  validates :title, :presence => true
  validates :description, :presence => true
end
