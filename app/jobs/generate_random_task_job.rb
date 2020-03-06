class GenerateRandomTaskJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @task = Task.new
    @task.user_id = user_id
    @task.name = Faker::Lorem.sentence
    @task.content = Faker::Lorem.sentence
    @task.save
  end
end