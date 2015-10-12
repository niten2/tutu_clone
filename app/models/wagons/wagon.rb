 class Wagon < ActiveRecord::Base
  validates :number, presence: true
  validates :number, uniqueness: true

  belongs_to :train

  scope :economy, -> { where(type: 'EconomyWagon') }
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :sleeping, -> { where(type: 'SleepingWagon') }
  scope :seat, -> { where(type: 'SeatWagon') }

  scope :sort_number_up, -> { order('number_in_train DESC') }
  scope :sort_number_down, -> { order('number_in_train') }


end


# delegate :economy, :coupe, :sleeping, :seat, to: :wagons
