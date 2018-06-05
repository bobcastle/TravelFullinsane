class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true,length: { minimum: 5 }

  validates :text, presence: true

  validates :destination, presence: true,length: { within: 6..20 }

  validates :theme, presence: true, length: { within: 6..20 }

  validates :duree, presence: true, numericality: { only_integer: true }

  validates :budget, presence: true, numericality: { only_integer: true }

  #validates :photo, presence: true


  #belongs_to :user
  has_many :favorites, dependent: :destroy

  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }
end
