require 'faker'

def jobs
    return Array.new(30) do
      employment_type = ["Full-time", "Contract"].sample
      status = ["Open", "Accepting Candidates", "On Hold", "Placed", "Closed-Lost"].sample
      {
        job_title: Faker::Job.title,
        employment_type: employment_type,
        status: status,
        is_live: %w[Open Accepting\ Candidates On\ Hold].include?(status) ? 1 : 0,
        salary: employment_type == "Full-time" ? rand(250..800) * 100 : 0,
        client_contact: ClientContact.all.sample,
        user: User.all.sample
      }
    end
end
