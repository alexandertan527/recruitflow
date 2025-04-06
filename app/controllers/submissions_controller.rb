class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :destroy]

  def index
    @submissions = Submission.all.order(id: :desc)
  end

  def show
  end

  def destroy
    @submission.destroy
    redirect_to submissions_path
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end
end
