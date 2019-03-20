class Payment < ApplicationRecord
  belongs_to :task

  monetize :amount_cents
end
