class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
