class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :event_attendances

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  def self.past
    self.where("date < ?", Date.today)
  end

  def self.upcoming
    self.where("date >= ?", Date.today)
  end
end
