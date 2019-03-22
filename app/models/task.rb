class Task < ApplicationRecord
  has_many :reviews
  has_one :payment
  belongs_to :owner, class_name: "User", foreign_key: "owner_user_id"
  belongs_to :worker, class_name: "User", foreign_key: "worker_user_id", optional: true


  monetize :price_cents

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :picture, PhotoUploader

  def self.all_categories
    self.all.pluck(:category).sort.uniq
  end

end
