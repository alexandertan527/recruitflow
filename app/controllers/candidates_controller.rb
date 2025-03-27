class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show]

  def index
    @candidates = Candidate.order(id: :desc)
  end

  def show
  end

  def new
    @candidate = Candidate.new
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
