class Entity < ApplicationRecord
  validates :name, presence: { message: 'You must fill in the entity name' }
  validates :amount, presence: { message: 'You must fill in the entity amount' },
                     numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :groups
  belongs_to :user
end
