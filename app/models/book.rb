class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, length:{ maximum:200 }
  validates :category, presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end  
  
end
