require 'spec_helper'

describe "trips/show" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
