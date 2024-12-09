class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy

  # Validations (if any)
  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
