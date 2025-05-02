class Client < ApplicationRecord
  belongs_to :user
  has_many :client_contacts
  has_many :jobs, through: :client_contacts
  validates :name, :status, presence: true
  validates :status, inclusion: { in: ["Active", "Hiring", "Passive Account", "Inactive"]}
end
