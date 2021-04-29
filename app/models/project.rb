class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
end
