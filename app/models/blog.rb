class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include Discard::Model

  validates_presence_of :title, :body

  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :deleted_by, class_name: "User", optional: true

  after_discard do
    comments.discard_all
  end

  after_undiscard do
    comments.where(deleted_by: nil).undiscard_all
  end
end
