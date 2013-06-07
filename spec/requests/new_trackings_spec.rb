require 'spec_helper'

describe "NewTrackings" do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  	@user = FactoryGirl.build(:user)
  	project = FactoryGirl.build(:awesomeproject)
    sign_in @user
  	visit new_tracking_path
  end
  it "creates tracking when fully filled in" do
  	expect{
      fill_in "tracking_minutes", :with => 5
  	  fill_in "tracking_description", :with => "This is a test"
  	  
  	  # fill_in "Project", :with => project
  	  fill_in "Starttime", :with => "02-02-2013 13:45"
  	  click_link_or_button "Create Tracking"
  	}.to change(Tracking,:count).by(1)
  end

end
