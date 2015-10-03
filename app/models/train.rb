class Train < ActiveRecord::Base
  validates :number, presence: true

  belongs_to  :route
  has_many    :tickets
  has_many    :wagons

  def reserved_seat
    reserved_seat = []
    self.wagons.each do |wagon|
      if wagon.style == "плацкартный"
        reserved_seat << wagon
      end
    end
    return reserved_seat
  end

  def compartment
    compartment = []
    self.wagons.each do |wagon|
      if wagon.style == "купейный"
        compartment << wagon
      end
    end
    return compartment
  end


# binding.pry



# def count_lower_places
#    # @train.wagons.each do |wagon|
# end




end
