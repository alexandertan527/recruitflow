class PlacementsController < ApplicationController
  before_action :set_placement, only: [:show, :edit, :update, :destroy]
  before_action :find_candidate_or_job, only: [:new, :create, :edit, :update]

  def index
    @placements = Placement.all.order(id: :desc)
  end

  def show
  end

  def new
    @placement = Placement.new()
    @placement.employment_type = @job.employment_type
  end

  def create
    @placement = Placement.new(placement_params)
    @placement.user = current_user
    if @placement.save
      redirect_to placement_path(@placement), notice: "Placement was created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @placement.update(placement_params)
    redirect_to placement_path(@placement)
  end

  def destroy
    @placement.destroy
    redirect_to placements_path
  end

  private

  def set_placement
    @placement = Placement.find(params[:id])
  end

  def placement_params
    params.require(:placement).permit(:job_id, :candidate_id, :start_date, :end_date, :employment_type, :status, :salary)
  end

  def find_candidate_or_job
    if params[:candidate_id]
      @candidate = Candidate.find(params[:candidate_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id]) if params[:job_id] != nil
    end
  end
end
