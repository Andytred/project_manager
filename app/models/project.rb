class Project < ApplicationRecord
  has_many :tags
  has_many :tasks
  belongs_to :user
end
