require 'spec_helper'

describe User do
  user = FactoryGirl.build(:user)
  admin = FactoryGirl.build(:admin)

  describe "validation" do
    describe "of email" do
      it "requires presence" do
        user.email = nil
        user.should_not be_valid
      end

      it "requires a unique email address" do
        user.email = admin.email
        user.should_not be_valid
      end

      it "requires a vaild email address" do
        user.email = "somebody@anywhere"
        user.should_not be_valid
      end
    end
  end
  
end
