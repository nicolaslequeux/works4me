class ReviewsController < ApplicationController
  def index
    raise
    @reviews = []

    Task.where(owner: current_user).each do |task|
      @reviews << Review.where(task: task) #not sure about this line
    end

    @reviews.flatten!
  end

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
      redirect_to task_path(@review.task)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
