class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # validates :name, presence: true
  # validates :name, uniqueness: true

  has_many :tickets
end
