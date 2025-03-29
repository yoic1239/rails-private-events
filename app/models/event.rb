class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :event_attendances

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Date.today).order(date: :desc) }
  scope :upcoming, -> { where("date >= ?", Date.today).order(date: :asc) }
end
