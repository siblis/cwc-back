class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Task.find_each(deadline: Time.now.midnight..(Time.now.midnight + 5.day)) do |task|
      TaskMailer.warnin_email(task).deliver_later
    end
  end
end
