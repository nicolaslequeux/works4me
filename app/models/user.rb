class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook]

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

  def self.find_worker_by_task(review)
    User.find(Task.find(review.task_id).worker_user_id)
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation

      user.save
    end

    return user
  end

end

