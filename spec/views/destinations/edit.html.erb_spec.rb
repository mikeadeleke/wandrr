require 'spec_helper'

describe "destinations/edit" do
  before(:each) do
    @destination = assign(:destination, stub_model(Destination,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", destination_path(@destination), "post" do
      assert_select "input#destination_name[name=?]", "destination[name]"
      assert_select "textarea#destination_description[name=?]", "destination[description]"
    end
  end
end
