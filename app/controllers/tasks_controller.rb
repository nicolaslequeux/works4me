class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.owner_user_id = current_user.id
    @task.save

    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :category, :description, :price, :address, :status, :picture)
  end
end
