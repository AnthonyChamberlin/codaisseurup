class Event < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :categories

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :location,    presence: true
end
