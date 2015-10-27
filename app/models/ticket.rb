class Ticket < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :train
  belongs_to :user
  belongs_to :starting_station, class_name: 'RailwayStation', foreign_key: :starting_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create :send_notification

  def route_name
    # binding.pry
    "#{train.number}"
    # "#{starting_station.name} - #{end_station.name}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
