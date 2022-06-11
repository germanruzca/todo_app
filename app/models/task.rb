class Task < ApplicationRecord
  belongs_to :board, dependent: :destroy

  validates :title, presence: true
end
