class InterviewsController < ApplicationController
  before_action :find_candidate_or_job, only: [:new, :create]

  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new()
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user = current_user

    if @interview.save
      if params[:candidate_id]
        redirect_to candidate_path(@candidate), notice: "Interview was created successfully!"
      elsif params[:job_id]
        redirect_to job_path(@job), notice: "Interview was created successfully!"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:candidate_id, :job_id, :type, :interview_date)
  end

  def find_candidate_or_job
    if params[:candidate_id]
      @candidate = Candidate.find(params[:candidate_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id]) if params[:job_id] != nil
    end
  end

end
