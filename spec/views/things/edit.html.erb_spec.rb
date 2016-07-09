require 'spec_helper'

describe "things/edit" do
  before(:each) do
    @thing = assign(:thing, stub_model(Thing))
  end

  it "renders the edit thing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", thing_path(@thing), "post" do
    end
  end
end
