class TimeSlot < ApplicationRecord
  belongs_to :campaign

  default_scope { order(start_at: :asc) }

  validates :start_at, presence: true
end
