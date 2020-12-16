class Comment < ApplicationRecord
  validates_presence_of :content

  belongs_to :blog
  belongs_to :user

  def self.by_created_at
    order("created_at DESC")
  end
end
