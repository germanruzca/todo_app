class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks

  def show_taks
    self.tasks
  end
end
