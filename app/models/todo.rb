class Todo < ApplicationRecord
  validates_presence_of :name, :due_date
end
