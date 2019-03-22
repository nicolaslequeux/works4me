class PaymentsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])

  end

  def create
    @task = Task.find(params[:task_id])

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @task.price_cents,
      description:  "Payment for task #{@task.id}",
      currency:     @task.price.currency
    )

    payment = Payment.create(
      payload: charge.to_json,
      amount: @task.price,
      state: 'paid',
      task: @task,
    )

    @task.payment = payment
    @task.save
    redirect_to task_path(@task)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  def show
    # @payment = Payment.find(params[:id])
    # @task = Task.find(params[:task_id])
  end

  def update

  end

  # private

  # def update_task
  #   @payment = Payment.find(params[:id])
  #   @task = Task.find(params[:task_id])
  #   @status = params[:payment][:task_status]
  #   if @status == "rejected"
  #     @task.status = "pending"
  #   else
  #     @task.status = @status
  #   end
  #   @task.save
  #   redirect_to task_payment_path(@task, @payment)
  # end
end
