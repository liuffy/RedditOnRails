require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
# describe User do
#   subject(:user) do
#     FactoryGirl.build(:user,
#       username: "jonathan",
#       password: "good_password")
#   end

# Presence of name
# Presence of password_digest
# Length of password > 6
  it { should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

# You should test the following associations:
# has_many :subs
# has_many :user_votes
# has_many :comments

  it { should have_many(:subs)}
  it { should have_many(:votes)}
  it { should have_many(:comments)}

# Next, it's time for a review of plain old RSpec!
# Write methods to test #is_password?,
# #reset_session_token, and
# ::find_by_credentials.

  describe "is_password?" do
    let(:user) {User.new(username: "jonathan", password:"good_password")}

    it "verifies a password is correct" do
      expect(user.is_password?(user.password)).to be true
    end

    it "verifies a password is incorrect" do
      expect(user.is_password?("aaa")).to be false
    end
  end

  describe "reset_session_token" do
    let(:user) {User.new(username: "jonathan", password:"good_password")}
    it "sets a new session token on the user" do
     user.valid?
     old_session_token = user.session_token
     user.reset_session_token!

   # Miniscule chance this will fail.
   expect(user.session_token).to_not eq(old_session_token)
 end

 it "returns the new session token" do
   expect(user.reset_session_token).to eq(user.session_token)
 end
end

  describe "find_by_credentials" do
    let(:user) {User.new(username: "jonathan", password:"good_password")}
    before {user.save!}

    it "finds someone if the credentials are correct" do
        expect(User.find_by_credentials("jonathan", "good_password")).to eq(user)
    end

    it "returns nil if the credentials are not correct" do
        expect(User.find_by_credentials("jonathan", "garbage_password")).to eq(nil)
    end
  end

end
