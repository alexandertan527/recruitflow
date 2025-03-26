# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


require_relative "data/users"
require_relative "data/candidates"

p "Destroying existing records..."
User.destroy_all
Candidate.destroy_all
p "Records destroyed"

p "Creating users..."
users.each { |user| User.create!(user) }
p "Users created"

p "Creating candidates..."
candidates.each { |candidate| Candidate.create!(candidate) }
p "Candidates created"
