class Candidate < ApplicationRecord
  belongs_to :user
  has_many :submissions
  has_many :interviews
  has_many :offers
  validates :first_name, :last_name, :email, :status, presence: true
  validates :status, inclusion: { in: ["Active", "Available", "Interviewing", "Under Offer", "Pre-screened", "Placed"]}
end
