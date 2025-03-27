class Client < ApplicationRecord
  belongs_to :user
  validates :name, :status, presence: true
  validates :status, inclusion: { in: ["Active", "Hiring", "Passive Account", "Inactive"]}
end
