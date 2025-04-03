class Job < ApplicationRecord
  belongs_to :client_contact
  belongs_to :user
end
