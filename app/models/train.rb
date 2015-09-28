class Train < ActiveRecord::Base

  belongs_to :route

  has_many :tickets


end
