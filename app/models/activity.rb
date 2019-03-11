class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  scope :newest, ->{order created_at: :desc}

  after_create_commit{ActivityBroadcastJob.perform_later self}
end
