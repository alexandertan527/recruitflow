require 'faker'

def clients

  return Array.new(10) do
    {
      name: Faker::Company.name,
      sector: Faker::Company.industry,
      status: "Active",
      user: User.all.sample
    }
  end
end
