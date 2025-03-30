require 'faker'

def contacts

  return Array.new(15) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      position: "Hiring Manager",
      Faker::Config.locale = 'en-UK'
      phone_number: Faker::PhoneNumber.cell_phone_with_country_code
      client: Client.all.sample
      user: User.all.sample
    }
  end
end
