class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :demo_login ]

  def home
  end

  def demo_login
    demo_user = User.where(email: 'demo@gmail.com').first
    sign_in(demo_user)
    redirect_to root_path, notice: "Signed in as demo user"
  end
end
