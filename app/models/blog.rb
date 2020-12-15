class Blog < ApplicationRecord
  validates_presense_of :title, :body
end
