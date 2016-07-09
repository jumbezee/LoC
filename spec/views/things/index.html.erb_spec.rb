require 'spec_helper'

describe "things/index" do
  before(:each) do
    assign(:things, [
      stub_model(Thing),
      stub_model(Thing)
    ])
  end

  it "renders a list of things" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
