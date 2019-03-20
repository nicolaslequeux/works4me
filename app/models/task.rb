class Task < ApplicationRecord
  has_many :reviews
  has_one :payment
  belongs_to :owner, class_name: "User", foreign_key: "owner_user_id"
  belongs_to :worker, class_name: "User", foreign_key: "worker_user_id", optional: true
end
