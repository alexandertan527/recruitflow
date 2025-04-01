require 'faker'

def contacts

  Faker::Config.locale = 'en-GB'
  return Array.new(15) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      position: ["Hiring Manager", "HR", "CEO", "HR Director"].sample,
      phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
      status: "Active",
      client: Client.all.sample,
      user: User.all.sample
    }
  end
end

