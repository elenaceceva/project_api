class Task < ApplicationRecord
  belongs_to :user

  def self.create_random(n)
    n.times do
      GenerateRandomTaskJob.perform_later
    end
  end
end
