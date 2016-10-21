require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end
  # EXAMPLE:
  # describe "POST #create" do
  #
  # context "with invalid params" do
  #   it "validates the presence of title and body" do
  #     post :create, link: {title: "this is an invalid link"}
  #     expect(response).to render_template("new")
  #     expect(flash[:errors]).to be_present
  #   end
  # end


  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "jonathan"}
        expect(flash[:errors]).to be_present
      end
    end
      it "validates that the password is at least 6 characters long" do
        post :create, user: {username: "jonathan", password: "aaa"}
        expect(flash[:errors]).to be_present
    end
  end

    context "with valid params" do
      it "redirects user to links index on success" do
        post :create, user: {username: "jonathan", password: "good_password"}
        expect(response).to redirect_to(subs_url)
    end
  end
end
