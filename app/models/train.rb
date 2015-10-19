class Train < ActiveRecord::Base
  validates :number,  presence: true
  validates :number,    uniqueness: true

  has_many    :tickets
  has_many    :wagons
  belongs_to  :route
end
