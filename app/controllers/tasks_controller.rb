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
    @payment = @task.payment
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

  def update
    @task = Task.find(params[:id])
    @payment = @task.payment
    update_task_status
  end

  private

  def task_params
    params.require(:task).permit(:name, :category, :description, :price, :address, :status, :picture)
  end

  def update_task_status
    @task = Task.find(params[:id])
    if @task.owner == current_user
      @status = params[:task][:task_status]
      if @status == "rejected"
        @task.status = "pending"
      else
        @task.status = @status
      end
      @task.save
      redirect_to task_path(@task, @payment)
    else
      @task.status = "accepted"
      @task.worker = current_user
      @task.save!
      redirect_to task_path(@task)
    end
  end
end
