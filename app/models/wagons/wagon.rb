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
      if train.wagons.present?
        self.number =  train.wagons.sort_number_down.last.number + 1
      end
  end

end


# def set_number_train(train = "train")
#      # puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
# if train == nil
# number = "Номер не назначен"
# else
# self.number =  train.wagons.last.number + 1
#
# train.wagons.sort_number_down.first.number
# binding.pry
# binding.pry
# def set_number_train_first
#     self.number = 1
#   end
# after_update   :set_number_train
