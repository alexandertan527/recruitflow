class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :destroy]
  before_action :find_candidate_or_job, only: [:new, :create]

  def index
    @offers = Offer.all.order(id: :desc)
  end

  def show
  end

  def new
    @offer = Offer.new()
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      if params[:candidate_id]
        redirect_to candidate_path(@candidate), notice: "Offer was created successfully!"
      elsif params[:job_id]
        redirect_to job_path(@job), notice: "Offer was created successfully!"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    redirect_to params[:redirect_to].presence || offers_path, notice: "Offer was deleted"
  end

  private

  def offer_params
    params.require(:offer).permit(:candidate_id, :job_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def find_candidate_or_job
    if params[:candidate_id]
      @candidate = Candidate.find(params[:candidate_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id])
    end
  end

end
