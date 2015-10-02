class Wagon < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :train
end
