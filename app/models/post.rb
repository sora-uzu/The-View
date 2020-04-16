class Post < ApplicationRecord
	attachment :image
	belongs_to :user
end
