class JobsController < ApplicationController

  def index
    @jobs = Job.order(id: :desc)
  end

end
