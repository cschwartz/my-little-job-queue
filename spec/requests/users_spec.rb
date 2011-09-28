require 'spec_helper'

describe "Users" do
  before(:each) do
    @user = Factory(:user)
  end
  
  describe "GET /" do
    describe "if not signed in" do
      it "should redirect to /users/sign_in" do
        visit root_path
        current_path.should == new_user_session_path
      end
      
      it "should return to the dashboard site if signed in correctly" do
        visit root_path
        fill_in "Email", :with => @user.email
        fill_in "Password", :with => @user.password
        click_button "Sign in"
        current_path.should == root_path
      end
    end
    
    describe "if signed in" do
      before(:each) do
        visit new_user_session_path
        fill_in "Email", :with => @user.email
        fill_in "Password", :with => @user.password
        click_button "Sign in"
      end
      
      it "should show the dashboard site" do
        visit root_path
        current_path.should == root_path
      end
    end
  end
end
