class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def faq
  end

  def about
  end

  def contact
  end

  def profile
    # "show" view for user
    @user = current_user
  end

  def worker_profile
    @task = Task.find(params[:id])
    @user = @task.worker
  end
end

