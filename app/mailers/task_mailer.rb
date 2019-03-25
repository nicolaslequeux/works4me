class TaskMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task_mailer.task_accepted_email.subject
  #
  def task_accepted_email(task)
    @task = task

    mail(
      to:       @task.owner.email,
      subject:  "Task #{@task.name} accepted!"
    )
  end

  def worker_reject_email(task)
    @task = task

    mail(
      to:       @task.worker.email,
      subject:  "Your service for #{@task.name} was rejected!"
    )
  end

  def worker_accept_email(task)
    @task = task

    mail(
      to:       @task.worker.email,
      subject:  "Your service for #{@task.name} was accepted!"
    )
  end
end
