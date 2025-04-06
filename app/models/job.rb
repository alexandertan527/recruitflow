class Job < ApplicationRecord
  belongs_to :client_contact
  belongs_to :user
  validates :job_title, :status, :is_live, :employment_type, presence: :true
  validates :status, inclusion: { in: ["Accepting Candidates", "Open", "On Hold", "Placed", "Closed-Lost"]}
  validates :employment_type, inclusion: { in: ["Full-time", "Contract"]}
end
