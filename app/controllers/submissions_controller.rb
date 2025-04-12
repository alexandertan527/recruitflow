class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :destroy]
  before_action :find_candidate_or_job, only: [:new, :create]

  def index
    @submissions = Submission.all.order(id: :desc)
  end

  def show
  end

  def new
    @submission = Submission.new()
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user = current_user

    if @submission.save
      if params[:candidate_id]
        redirect_to candidate_path(@candidate), notice: "Submission was created successfully!"
      elsif params[:job_id]
        redirect_to job_path(@job), notice: "Submission was created successfully!"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @submission.destroy
    redirect_to params[:redirect_to].presence || submissions_path, notice: "Submission was deleted"
  end

  private

  def submission_params
    params.require(:submission).permit(:candidate_id, :job_id)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def find_candidate_or_job
    if params[:candidate_id]
      @candidate = Candidate.find(params[:candidate_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id]) if params[:job_id] != nil
    end
  end
end
