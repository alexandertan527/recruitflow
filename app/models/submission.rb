class Submission < ApplicationRecord
  belongs_to :job
  belongs_to :candidate
  belongs_to :user
end
