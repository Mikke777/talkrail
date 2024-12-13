class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :messages, dependent: :destroy
  scope :involving, ->(user) { where(user: user).or(where(profile: user.profile)) }
end
