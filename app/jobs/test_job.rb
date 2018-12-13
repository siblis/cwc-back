class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Task.find_each(deadline: Time.now.midnight..(Time.now.midnight + 5.day)) do |task|
      #  Here will be sending messages
    end
  end
end
