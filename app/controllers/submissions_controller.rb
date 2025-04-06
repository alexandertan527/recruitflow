class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :destroy]

  def index
    @submissions = Submission.all.order(id: :desc)
  end

  def show
  end

  def destroy
    @submission.destroy
    redirect_to params[:redirect_to].presence || submissions_path, notice: "Submission was deleted"
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def find_candidate
    # @candidate = Candidate.find(params[:candidate_id])
  end
end
