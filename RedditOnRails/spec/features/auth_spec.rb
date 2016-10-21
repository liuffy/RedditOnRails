require 'rails_helper'


feature "the signup process" do # complete

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Create account"
  end

  feature "signing up a user" do # fill in scenarios
    before(:each) do
      visit new_user_url
      fill_in 'user[username]', :with => "testing_username"
      fill_in 'user[password]', :with => "biscuits"
      click_on "submit_button" # added ID so capybara could find it :-) 
    end

    scenario "redirects to subs index page after signup" do #1
        expect(page).to have_content "All the subs!"
      end

    scenario "shows username on the homepage after signup" do #2
        expect(page).to have_content "testing_username"
      end
    end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'user[username]', :with => "testing_username"
      click_on "submit_button"
    end

    scenario "re-renders the signup page if an invalid user is given" do #3
      expect(page).to have_content "Create account"
  end
end

end
