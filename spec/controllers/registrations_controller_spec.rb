require 'spec_helper'

describe RegistrationsController do
  user = FactoryGirl.build(:user)
  admin = FactoryGirl.build(:admin)

  describe "#update" do

    describe "email" do
      before do
        @paramsUser = { :id => user.id, :email => "testchange@prellele.de" }
        @params = { :utf8 => "✓", :method=> "put",
                  :user => { :id => user.id, :email => "testchange@prellele.de" }  }

      end
      it "does overwrite email without current password" do
        user.update_without_password(@paramsUser).should change(user, :email)
      end

      it "does overwrite email without current password" do
        lambda {
          put :update, @params
        }.should change(user, :email)
      end
    end
  end
  
end
