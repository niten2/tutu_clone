class Ticket < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :train
  belongs_to :user
  # belongs_to :railway_station


end
