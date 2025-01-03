class Attendee < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } # ensures email follows standard format with @
end
