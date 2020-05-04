# frozen_string_literal: true

class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  validates  :user_id, presence: true
  validates  :title, presence: true, length: { maximum: 30 }
  validates  :latitude, presence: true
  validates  :image, presence: true
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  # いいね順
  def self.create_like_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(9).pluck(:post_id))
  end
end
