# Preview all emails at http://localhost:3000/rails/mailers/task_mailer
class TaskMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/task_mailer/task_accepted_email
  def task_accepted_email
    TaskMailer.task_accepted_email
  end

end
