class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @tasks = Task.where(id: 1)
  end
end
