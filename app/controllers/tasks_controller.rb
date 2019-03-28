class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tasks = filter_tasks
    @tasks = Task.all if @tasks.empty? # POSSIBLY GET RID OF THIS
    @tasks = @tasks.where(status: "pending")
    @tasks_mapped = @tasks.where.not(latitude: nil, longitude: nil)
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
    @markers = [@task].map do |task|
      {
        lat: task.latitude,
        lng: task.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { task: task }),
        image_url: helpers.asset_url('https://picsum.photos/300/300/?random')
      }
    end
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

  def my_tasks
    @my_owner_tasks = Task.where(owner: current_user)
    @my_worker_tasks = Task.where(worker: current_user)
  end

  def my_jobs
    @my_owner_tasks = Task.where(owner: current_user)
    @my_worker_tasks = Task.where(worker: current_user)
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
        # MAILER, UNCOMMENT LATER
        # TaskMailer.worker_reject_email(@task).deliver_now
        @task.status = "pending"
        @task.rejections << @task.worker.id
      elsif @status == "canceled"
        @task.status = "canceled"
      else
        @task.status = @status
        # if @task.status == "confirmed"
          # MAIler, UNCOMMENT LATER
          # TaskMailer.worker_accept_email(@task).deliver_now
        # end
      @task.save
      redirect_or_fallback(task_path(@task, @payment))
      end

    else
      @task.status = "accepted"
      @task.worker = current_user
      # MAILER, UNCOMMENT LATER
      # TaskMailer.task_accepted_email(@task).deliver_now
      @task.save!
      redirect_or_fallback(task_path(@task))
    end

  end

  #Filters tasks based on search keyword and task category
  def filter_tasks
    tasks = Task.all
    if params[:keyword].present? && params[:keyword] != "All"
      tasks = Task.where("name @@ ? OR description @@ ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end

    if params[:category].present? && params[:category] != "All"
      tasks = tasks.where(category: params[:category])
    end

    # UNCOMMENT WHEN MORE SEEDS! --> NOT ENOUGH TASKS FOR TESTING RADIUS
    if params[:radius].present? && params[:radius] != "All"
      tasks = tasks.near([current_user.latitude, current_user.longitude], params[:radius].to_i)
    end
    return tasks
  end
end
