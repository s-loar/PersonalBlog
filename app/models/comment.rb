class Comment < ApplicationRecord
  include Discard::Model
  validates_presence_of :content

  belongs_to :blog
  belongs_to :user
  belongs_to :deleted_by, class_name: "User", optional: true

  def self.by_created_at
    order("created_at DESC")
  end
end
