class Interview < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  belongs_to :user
  validates :interview_type, inclusion: { in: ["1st Interview", "2nd Interview", "Further Interview", "Final Interview"]}
  validates :interview_date, :candidate, :job, presence: true
end
