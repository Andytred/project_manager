class Tag < ApplicationRecord
  belongs_to :project
  has_many :tag_assignments
  has_many :tasks, through: :tag_assignments

  
end
