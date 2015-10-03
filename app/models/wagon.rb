class Wagon < ActiveRecord::Base
  validates :number, presence: true
  validates :number, uniqueness: true

  belongs_to :train
end
