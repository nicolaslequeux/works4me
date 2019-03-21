class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews

  has_many :owned_tasks, class_name: "Task", foreign_key: "owner_user_id"
  has_many :assigned_tasks, class_name: "Task", foreign_key: "worker_user_id"

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :avatar, PhotoUploader

  def average_rating_received
    sum = 0.0
    counter = 0
    Task.where(owner: self).each do |task|
      task.reviews.each do |review|
      sum += review.rating
      counter += 1
      end
    end
    (sum / counter).round(1)
  end

  def average_rating_received_from_user_view
    sum = 0.0
    counter = self.reviews.count
    self.reviews.each do |review|
      sum += review.rating
    end
    (sum / counter).round(2)
  end

end

