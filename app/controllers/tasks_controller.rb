class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks_mapped = Task.where.not(latitude: nil, longitude: nil)

    @markers = @tasks.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
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

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :category, :description, :price, :address, :status, :picture)
  end
end
