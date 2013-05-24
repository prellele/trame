require 'spec_helper'

describe User do
  user = FactoryGirl.build(:user)
  admin = FactoryGirl.build(:admin)
  awesomeproject = FactoryGirl.build(:awesomeproject)
  tracking = FactoryGirl.build(:tracking_awesomeproject)

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

  describe "return value" do
    describe "of workinghours" do

      it "is right" do
        expect(user.workinghours()).to eq(120)
      end

    end
  end
   
end
