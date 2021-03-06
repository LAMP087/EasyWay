require 'spec_helper'

describe "notify_events/index", type: :view do
  before(:each) do
    assign(:notify_events, [
      stub_model(NotifyEvent,
        :event_id => 1,
        :name => "Name 1",
        :notify_observer_id => 2,
        :notify_template_id => 3
      ),
      stub_model(NotifyEvent,
        :event_id => 1,
        :name => "Name 2",
        :notify_observer_id => 2,
        :notify_template_id => 3
      )
    ])
  end

  it "renders a list of notify_events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name 1".to_s, :count => 1
    assert_select "tr>td", :text => "Name 2".to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
