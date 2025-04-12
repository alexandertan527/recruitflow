class Interview < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  belongs_to :user
  validates :type, inclusion: { in: ["1st Interview", "2nd Interview", "Further Interview", "Final Interview"]}
  validates :interview_date, presence: true
end
