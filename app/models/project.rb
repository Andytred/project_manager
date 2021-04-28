class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  
end
