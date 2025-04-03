require 'faker'

def jobs
    return Array.new(30) do
      {
        job_title: Faker::Job.title,
        employment_type: ["Full-time", "Contract"].sample,
        status: ["Open", "Accepting Candidates", "On Hold", "Placed", "Closed-Lost"].sample,
        is_live:
          if :status == "Open" || :status == "Accepting Candidates" || :status == "On Hold"
            1
          elsif :status == "Placed" || :status == "Closed-Lost"
            0
          end,
        salary:
        if :employment_type == "Full-time"
          rand(250..800) * 100
        elsif :employment_type == "Contract"
          0
        end,
        client_contact: ClientContact.all.sample,
        user: User.all.sample
      }
    end
end
