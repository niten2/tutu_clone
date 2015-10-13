class Train < ActiveRecord::Base
  validates :number,  presence: true
  validates :number,    uniqueness: true

  has_many    :tickets
  has_many    :wagons
  belongs_to  :route

  def add_wagon_method(train, wagon)
    train.wagons << wagon
    wagon.number_in_train = train.wagons.length + 1
  end

  def remove_wagon_method(train, wagon)
    @wagon.number_in_train = nil && @wagon.save
    @train.wagons.delete(@wagon)
  end

private

end
