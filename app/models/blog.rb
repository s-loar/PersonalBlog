class Blog < ApplicationRecord
  validates_presence_of :title, :body

  has_many :comments, dependent: :destroy
  belongs_to :user
end
