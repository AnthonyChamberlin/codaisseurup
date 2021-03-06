class Event < ApplicationRecord
  belongs_to :user, optional: true

  has_and_belongs_to_many :categories
  has_many :photos
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :location,    presence: true

  scope :published, -> { where(active: true) }

  def self.order_by_name
    order(name: :asc)
  end

  def available?(checkin, checkout)
    registrations.each do |registration|
      if (registration.starts_at <= checkout) && (registration.ends_at >= checkin)
        return false
      end
    end
    
    true
  end
end
