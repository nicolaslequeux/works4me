class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tasks = Task.all
    @tasks_mapped = Task.where.not(latitude: nil, longitude: nil)

    @markers = @tasks.map do |task|
      {
        lat: task.latitude,
        lng: task.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { task: task }),
        image_url: helpers.asset_url('https://picsum.photos/300/300/?random')
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

    redirect_to new_task_payment_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :category, :description, :price, :address, :status, :picture)
  end
end
