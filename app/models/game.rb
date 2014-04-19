class Game < ActiveRecord::Base
  belongs_to :category
  mount_uploader :puzzle, PuzzleUploader

  validates_presence_of :category, :puzzle

  scope :recent, -> { order(created_at: :desc) }
end
