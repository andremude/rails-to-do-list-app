class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  enum status: {
    "Not Started": 0,
    "In Progress": 1,
    "Completed": 2
  }
end
