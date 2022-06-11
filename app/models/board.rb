class Board < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :tasks

  validates :name, presence: true
end
