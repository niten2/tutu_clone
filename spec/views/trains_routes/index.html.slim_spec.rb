require 'rails_helper'

RSpec.describe "trains_routes/index", type: :view do
  before(:each) do
    assign(:trains_routes, [
      TrainsRoute.create!(),
      TrainsRoute.create!()
    ])
  end

  it "renders a list of trains_routes" do
    render
  end
end
