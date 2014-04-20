class Game < ActiveRecord::Base
  belongs_to :category
  mount_uploader :puzzle, PuzzleUploader

  validates_presence_of :category, :puzzle

  scope :recent, -> { order(created_at: :desc) }

  paginates_per 96

  def name
    "#{category.name} #{id}"
  end

  def to_param
    if category.try(:name)
      "#{id}-jogar-#{category.name.parameterize}"
    else
      super
    end
  end
end
