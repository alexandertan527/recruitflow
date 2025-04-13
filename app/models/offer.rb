class Offer < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  belongs_to :user
  validates :candidate, :job, presence: true
end
