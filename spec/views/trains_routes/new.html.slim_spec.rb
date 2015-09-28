require 'rails_helper'

RSpec.describe "trains_routes/new", type: :view do
  before(:each) do
    assign(:trains_route, TrainsRoute.new())
  end

  it "renders new trains_route form" do
    render

    assert_select "form[action=?][method=?]", trains_routes_path, "post" do
    end
  end
end
