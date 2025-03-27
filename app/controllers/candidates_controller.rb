class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  def index
    @candidates = Candidate.order(id: :desc)
  end

  def show
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    if @candidate.save
      redirect_to candidate_path(@candidate), notice: "Candidate was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @candidate.update(candidate_params)
    redirect_to candidate_path(@candidate)
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :phone_number, :current_job_title, :status)
  end
end
