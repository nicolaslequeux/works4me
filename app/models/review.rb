class Review < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # SAVED FOR LATER
  # def self.my_reviews
  #   @reviews = []

  #   Task.where(owner: current_user).each do |task|
  #     @reviews << Review.where(task: task)
  #   end

  #   return @reviews.flatten!
  # end
end
