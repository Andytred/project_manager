class Tag < ApplicationRecord
  belongs_to :project
  has_many :tag_assignments, dependent: :destroy
  has_many :tasks, through: :tag_assignments, dependent: :destroy

  
end
