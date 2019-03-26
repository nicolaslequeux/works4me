class ReviewsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @review = Review.new
  end

  def create
    @task = Task.find(params[:task_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.task = @task
    if @review.save
      redirect_to my_tasks_path
    else
      flash[:alert] = "Oops! Something went wrong :("
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
