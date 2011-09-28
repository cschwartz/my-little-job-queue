require 'spec_helper'

describe DashboardController do
  render_views
  
  describe "index" do
    describe "for users" do
      before(:each) do
        @user = Factory(:user)
        sign_in @user
      end
    
      it "should have a signout link" do
        get :index
        response.should have_selector("a", :content => "Sign out")
      end
    end
    
    describe "for administrators" do
      before(:each) do
        @admin = Factory(:admin)
        sign_in @admin
      end

      it "should have a signout link" do
        get :index
        response.should have_selector("a", :content => "Sign out")
      end
      
      it "should have a link to the admin dashboard" do
        get :index
        response.should have_selector("a", :content => "Administration")
      end
    end
  end
end
