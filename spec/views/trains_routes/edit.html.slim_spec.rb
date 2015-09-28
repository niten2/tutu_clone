require 'rails_helper'

RSpec.describe "trains_routes/edit", type: :view do
  before(:each) do
    @trains_route = assign(:trains_route, TrainsRoute.create!())
  end

  it "renders the edit trains_route form" do
    render

    assert_select "form[action=?][method=?]", trains_route_path(@trains_route), "post" do
    end
  end
end
