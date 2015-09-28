require 'rails_helper'

RSpec.describe "trains_routes/show", type: :view do
  before(:each) do
    @trains_route = assign(:trains_route, TrainsRoute.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
