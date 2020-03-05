class GenerateRandomTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @task = Task.new
    @task.user_id = 1
    @task.name = Faker::Lorem.sentence
    @task.content = Faker::Lorem.sentence
    @task.save
  end
end