class TaskMailer < ApplicationMailer
  def warning_email(task)
    @task = task
    @doer = task.doer
    mail(to: @doer.email, subject: @task.title)
  end
end
