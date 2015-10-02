class Train < ActiveRecord::Base
  validates :number, presence: true

  belongs_to  :route
  has_many    :tickets
  has_many    :wagons

end
