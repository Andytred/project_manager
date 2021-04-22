class Project < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
