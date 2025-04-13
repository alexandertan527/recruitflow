class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]
  before_action :find_candidate_or_job, only: [:new, :create, :edit, :update]

  def index
    @interviews = Interview.all.order(id: :desc)
  end

  def show
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

  def edit
  end

  def update
    @interview.update(interview_params)
    if params[:candidate_id]
      redirect_to candidate_interview_path(@candidate, @interview), notice: "Interview updated!"
    elsif params[:job_id]
      redirect_to job_interview_path(@job, @interview), notice: "Interview updated!"
    else
      redirect_to interview_path(@interview), notice: "Interview updated!"
    end
  end

  def destroy
    @interview.destroy
    redirect_to params[:redirect_to].presence || interviews_path, notice: "Interview was deleted"
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:candidate_id, :job_id, :interview_type, :interview_date)
  end

  def find_candidate_or_job
    if params[:candidate_id]
      @candidate = Candidate.find(params[:candidate_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id])
    end
  end

end
