class Task < ApplicationRecord

  enum status: {
    "Not Started": 0,
    "In Progress": 1,
    "Completed": 2
  }
end
