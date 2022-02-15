class Group < ApplicationRecord
  validates :name, presence: { message: 'You must fill in the group name' }
  validates :icon, presence: { message: 'You must add an icon for the group' }
  belongs_to :user
  # has_one_attached :icon
  has_many :entities
end
