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

















# binding.pry
# def count_lower_places
#    # @train.wagons.each do |wagon|
# end

# def reserved_seat
#   reserved_seat = []
#   self.wagons.each do |wagon|
#     if wagon.style == "плацкартный"
#       reserved_seat << wagon
#     end
#   end
#   return reserved_seat
# end

# def compartment
#   compartment = []
#   self.wagons.each do |wagon|
#     if wagon.style == "купейный"
#       compartment << wagon
#     end
#   end
#   return compartment
# end
# scope :sort_number, -> { order('wagons.number_in_train') }
  # scope :sort_number, -> { order('number_in_train DESC') }
  # scope :economy, -> { where(type: 'EconomyWagon') }
