class Message < ApplicationRecord
  scope :for_number,        -> (number) { where(number: number).by_date }
  scope :by_date,           -> { order(created_at: :desc) }
  scope :recent_by_number,  -> { group(:number).having('created_at = MAX(created_at)') }

  validates :text,
    presence: true,
    allow_blank: false
end
