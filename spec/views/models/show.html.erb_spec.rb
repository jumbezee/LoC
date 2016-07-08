require 'spec_helper'

describe "models/show" do
  before(:each) do
    @model = assign(:model, stub_model(Model,
      :company => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company/)
  end
end
