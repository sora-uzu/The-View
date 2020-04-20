class Post < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :comments, dependent: :destroy

    geocoded_by :address
    after_validation :geocode
end
