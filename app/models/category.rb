class Category < ApplicationRecord
    validates :name, presence: true
    has_many :posts, class_name: "Post"
end
