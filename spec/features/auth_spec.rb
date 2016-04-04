require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    let(:user) { FactoryGirl.build(:user) }

    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_on "Create User"

      expect(page).to have_content(user.username)
    end
  end
end

feature "logging in" do
  let(:john) { FactoryGirl.create(:john) }

  scenario "shows username on the homepage after login" do
    visit new_session_url
    fill_in "Username", with: john.username
    fill_in "Password", with: john.password
    click_on "Log In"

    expect(page).to have_content(john.username)
  end
end

feature "logging out" do
  let(:john) { FactoryGirl.create(:john) }

  scenario "begins with logged out state" do
    visit new_session_url
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content('Sign Out')
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in "Username", with: john.username
    fill_in "Password", with: john.password
    click_on "Log In"
    click_on "Sign Out"

    expect(page).to_not have_content(john.username)
  end
end
