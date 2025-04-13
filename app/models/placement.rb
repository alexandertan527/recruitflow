class Placement < ApplicationRecord
  belongs_to :job
  belongs_to :candidate
  belongs_to :user
  validates :employment_type, :status, :start_date, :job, :candidate, presence: true
  validates :status, inclusion: { in: ["Submitted", "Approved", "Terminated", "Did Not Start"]}
end
