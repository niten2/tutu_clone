 class Wagon < ActiveRecord::Base
  belongs_to :train

  scope :economy, -> { where(type: 'EconomyWagon') }
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :sleeping, -> { where(type: 'SleepingWagon') }
  scope :seat, -> { where(type: 'SeatWagon') }

  scope :sort_number_up, -> { order('number DESC') }
  scope :sort_number_down, -> { order('number') }

  before_save     :set_number_train

  def type_name
    case self.type
      when "EconomyWagon"
        "Плацкарт"
      when "CoupeWagon"
        "Купе"
      when "SleepingWagon"
        "СВ"
      when "SeatWagon"
        "Сидячий"
      else
        "Тип не назначен"
    end
  end

  def set_number_train
      if train.wagons == []
        number = 1
      else
        unless train.wagons.maximum(:number) == nil
          number = train.wagons.maximum(:number) + 1
        end
      end
  end

end
