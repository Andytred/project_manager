class Task < ApplicationRecord
  belongs_to :project
  has_many :tag_assignments
  has_many :tags, through: :tag_assignments

  validates :title, presence: true

  def self.search(search)
    if search
      taskss = Task.find_by(title: search)
      if taskss
        self.where(id: taskss)
      else
        Task.all
      end
    else
      Task.all
    end
  end

end
