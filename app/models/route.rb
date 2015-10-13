class Route < ActiveRecord::Base
  validates :name, presence: true
  validate  :stations_count
  # validates :name, uniqueness: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, -> { order('railway_stations_routes.position') }, through: :railway_stations_routes

  # scope :position, -> { order "position" }

  before_validation :set_name

private

  def set_name
    self.name ||= "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

end

# scope :sort_number_down, -> { order('number_in_train') }
# , { order('railway_stations_routes.position') }
