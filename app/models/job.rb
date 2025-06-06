class Job < ApplicationRecord
  belongs_to :client_contact
  belongs_to :user
  has_many :submissions
  has_many :interviews
  has_many :offers
  has_one :placement
  validates :job_title, :status, :employment_type, presence: :true
  validates :status, inclusion: { in: ["Accepting Candidates", "Open", "On Hold", "Placed", "Closed-Lost"]}
  validates :employment_type, inclusion: { in: ["Full-time", "Contract"]}
end
