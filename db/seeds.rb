# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


require_relative "data/users"
require_relative "data/candidates"
require_relative "data/clients"
require_relative "data/contacts"
require_relative "data/jobs"

# p "Destroying existing records..."
# User.destroy_all
# Candidate.destroy_all
# Client.destroy_all
# p "Records destroyed"

# p "Creating users..."
# users.each { |user| User.create!(user) }
# p "Users created"

# p "Creating candidates..."
# candidates.each { |candidate| Candidate.create!(candidate) }
# p "Candidates created"

# p "Creating clients..."
# clients.each { |client| Client.create!(client) }
# p "Clients created..."

p "Creating contacts..."
contacts.each { |contact| ClientContact.create!(contact) }
p "Clients created..."

p "Creating jobs..."
jobs.each { |job| Job.create!(job) }
p "Jobs created..."
