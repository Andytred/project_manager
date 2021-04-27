class Task < ApplicationRecord
  belongs_to :project
  has_many :tag_assignments
  has_many :tags, through: :tag_assignments

  validates :title, presence: true
end
