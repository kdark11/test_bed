class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  
  extend FriendlyId
  friendly_id :title, use: :slugged
 end
