require 'spec_helper'

describe "models/index" do
  before(:each) do
    assign(:models, [
      stub_model(Model,
        :company => "Company"
      ),
      stub_model(Model,
        :company => "Company"
      )
    ])
  end

  it "renders a list of models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
