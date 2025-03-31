class ClientContact < ApplicationRecord
  belongs_to :user
  belongs_to :client
  validates :first_name, :last_name, :status, presence: true
  validates :status, inclusion: { in: ["Active", "Hiring", "Inactive"]}
end
