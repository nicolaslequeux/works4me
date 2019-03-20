class PaymentsController < ApplicationController
  def create
    task = Task.find(params[:task_id])
    payment = Payment.create!(task_sku: task.sku, amount: task.price, state: 'pending', user: current_user)

    redirect_to task_payment_path(payment)
  end
end
