class Bookmark < ApplicationRecord
  validates :list, uniqueness: { scope: :movie, message:"Unique movie in the list" }
  validates :comment, length: { minimum: 6 }
  belongs_to :movie
  belongs_to :list
  # before_destroy :prevent_destroy
end
