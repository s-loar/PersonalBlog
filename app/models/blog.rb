class Blog < ApplicationRecord
  validates_presence_of :title, :body

  has_many :comments, dependent: :destroy
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged
end
