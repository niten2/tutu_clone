class EconomyWagon < Wagon

  validates :count_top_places, :count_lower_places, :count_side_top_places, :count_side_lower_places, presence: true

end
